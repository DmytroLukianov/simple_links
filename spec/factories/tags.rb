FactoryGirl.define do
  factory :tag do
    sequence(:title){ |n| "#{Faker::Lorem.word}#{n}" }
  end
end
