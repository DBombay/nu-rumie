FactoryGirl.define do
  factory :rumie do
    sequence(:group_name) { |n| "Rumie Group #{n}" }
  end
end
