require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'validation test' do
    it 'ensures title is present' do
      event = Event.new(description: 'hello there, how are you ?', event_date: '2014-10-23').save
      expect(event).to eq(false)
    end
    it 'ensures description is present' do
      event = Event.new(title: 'My event', event_date: '2020-12-31 21:00:00').save
      expect(event).to eq(false)
    end
    it 'ensures event_date is present' do
      event = Event.new(title: 'My event', description: 'hello there, how are you ?').save
      expect(event).to eq(false)
    end
  end

  context 'association test' do
    it 'should have many event_attendances' do
      t = Event.reflect_on_association(:event_attendances)
      expect(t.macro).to eq(:has_many)
    end

    it 'should have many attendees' do
      t = Event.reflect_on_association(:attendees)
      expect(t.macro).to eq(:has_many)
    end
    it 'should belongs to creator' do
      t = Event.reflect_on_association(:creator)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end
