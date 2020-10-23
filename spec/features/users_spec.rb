require 'rails_helper'

RSpec.feature 'Users', type: :feature do # rubocop:disable Metrics/BlockLength
  context 'create new user' do
    before(:each) do
      visit new_user_path
      within('form') do
        fill_in 'Name', with: 'Amita'
      end
    end

    scenario 'should be successful' do
      within('form') do
        fill_in 'Email', with: 'amita@example.com'
        click_button 'Create Acccount'
      end

      expect(page).to have_content('Thanks for signing up!')
    end
    scenario 'should fail' do
      within('form') do
        click_button 'Create Acccount'
      end
      expect(page).to have_content("Email can't be blank")
    end
  end
  context 'Sign in ' do
    background do
      User.create(email: 'user@example.com', name: 'caplin')
    end

    scenario 'Signing in with correct credentials' do
      visit new_session_path
      within('form') do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'name', with: 'caplin'
        click_button 'Sign In'
      end

      expect(page).to have_content 'Welcome back, caplin!'
    end

    given(:other_user) { User.new(email: 'other@example.com', name: 'rous') }

    scenario 'Signing in as another user' do
      visit new_session_path
      within('form') do
        fill_in 'Email', with: other_user.email
        fill_in 'name', with: other_user.name
        click_button 'Sign In'
      end

      expect(page).to have_content 'No user found, Please enter valid name or email'
    end
  end
end
