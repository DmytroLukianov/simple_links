FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
  factory :user do
    email { generate(:email) }
    password '123456789'
    password_confirmation '123456789'
  end
end
