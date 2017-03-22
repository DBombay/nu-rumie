require 'rails_helper'

describe Rumie do
  it { should validate_presence_of(:group_name) }

  it "should have several users" do
    user1 = FactoryGirl.create!(:user)
    user2 = FactoryGirl.create!(:user)
    rumies = FactoryGirl.create!(:rumie)

    rumies.users.push(user1)
    rumies.users.push(user2)
    expect(rumies.users).to eq([user1, user2])
  end
end
