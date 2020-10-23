require "rails_helper"

RSpec.feature "Events", type: :feature do
  it "shows all the events" do
    visit root_url
    expect(page).to have_content("Events")
  end
end
