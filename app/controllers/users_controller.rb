class UsersController < ApplicationController
  before_action :require_signin, except: %i[new create]
  before_action :require_correct_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: 'Thanks for signing up!'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @past_events = @user.attended_events.where('event_date < ?', Time.now).order('event_date DESC')
    @upcoming_events = @user.attended_events.where('event_date > ?', Time.now).order('event_date DESC')
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to signin_path
  end

  private

  def require_correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user?(@user)
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
