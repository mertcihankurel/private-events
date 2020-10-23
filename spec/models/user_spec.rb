require "rails_helper"

RSpec.describe User, type: :model do
  context "validation test" do
    let(:user) { build(:user) }
    let(:rand_user) { build(:random_user) }

    it "ensure name is present" do
      user.name = nil
      expect(user.save).to eq(false)
    end

    it "ensures email is present" do
      user.email = nil
      expect(user.save).to eq(false)
    end
  end
  context "associations" do
    it "should have many events" do
      t = User.reflect_on_association(:events)
      expect(t.macro).to eq(:has_many)
    end

    it "should have many event_attendances" do
      t = User.reflect_on_association(:event_attendances)
      expect(t.macro).to eq(:has_many)
    end
    it "should have many attended_events" do
      t = User.reflect_on_association(:attended_events)
      expect(t.macro).to eq(:has_many)
    end
  end
end
