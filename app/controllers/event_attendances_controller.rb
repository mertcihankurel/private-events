class EventAttendancesController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    @attendance = EventAttendance.new(attendee_id: current_user, attended_event_id: event.id)
    @attendance.save
    event.attendees << current_user
    redirect_to event_path(event), notice: "You are successfully registered for the event!"
  end

  def destroy
    event = Event.find(params[:event_id])
    @attendance = EventAttendance.where({ attendee_id: current_user, attended_event_id: event.id })

    EventAttendance.delete(@attendance)
    event.attendees.delete(current_user)
    redirect_to event_path(event), notice: "We are not happy to see you go! 😞"
  end
end
