FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@gmail.com" }
    sequence(:first_name) { |n| "Jon#{n}" }
    sequence(:last_name) { |n| "Smith#{n}" }
    password 'password'
    password_confirmation 'password'
  end
end
