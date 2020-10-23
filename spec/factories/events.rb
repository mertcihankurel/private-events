FactoryBot.define do
  factory :event, class: "Event" do
    title { "My First Event" }
    description { "Hello there I am happy tp announce my first event" }
    event_date { "2020-12-31 21:00:00" }
    creator_is { 1 }
  end
end
