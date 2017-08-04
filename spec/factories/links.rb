FactoryGirl.define do
  factory :link do
    url   Faker::Internet.url
    description Faker::Lorem.paragraph
    user
  end
end
