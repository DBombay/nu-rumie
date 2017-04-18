require 'rails_helper'

describe RumieGroup do
  it { should be_a(RumieGroup) }

  it { should validate_presence_of(:group_name) }

  it "should have a user as a creator" do
    user1 = FactoryGirl.create(:user)
    rumies = FactoryGirl.create(:rumie_group, creator_id: user1.id)

    expect(rumies.creator_id).to be(user1.id)
  end

  it "cannot be initialized without a creator" do
    expect { FactoryGirl.create(:rumie_group) }.to raise_error
  end
end
