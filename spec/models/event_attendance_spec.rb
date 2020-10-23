require "rails_helper"

RSpec.describe EventAttendance, type: :model do
  context "association testing" do
    it "should belongs to user" do
      t = EventAttendance.reflect_on_association(:attendee)
      expect(t.macro).to eq(:belongs_to)
    end
    it "should belongs to event" do
      t = EventAttendance.reflect_on_association(:attended_event)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end
