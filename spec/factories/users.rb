FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "Jon#{n}" }
    sequence(:last_name) { |n| "Smith#{n}" }
    age 21
    sequence(:email) { |n| "user#{n}@gmail.com" }
    password 'password'
    password_confirmation 'password'
    city 'Philadelphia'
    state 'PA'
  end
end
