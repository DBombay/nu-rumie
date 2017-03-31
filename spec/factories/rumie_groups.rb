FactoryGirl.define do
  factory :rumie_group do
    sequence(:group_name) { |n| "Rumie Group #{n}" }
    city 'Philadelphia'
    state 'PA'
  end
end
