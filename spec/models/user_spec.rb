require 'rails_helper'

describe User do
  it { should be_a(User) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:age) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:role) }

  it 'should have a unique email address' do
    expect { FactoryGirl.create(:user, email: 'dog1@dogs.com') }.to_not raise_error
    expect { FactoryGirl.create(:user, email: 'dog1@dogs.com') }.to raise_error
  end

  it 'should have a valid email' do
    expect { FactoryGirl.create(:user, email: 'doglover1@dogs') }.to raise_error
    expect { FactoryGirl.create(:user, email: '@dogs.com') }.to raise_error
    expect { FactoryGirl.create(:user, email: 'doglover1.dogs.com') }.to raise_error
  end
end

describe '#admin?' do
  it "should return 'false' if the user is not an admin(confirm save)" do
    user = FactoryGirl.create(:user, role: "renter")
    expect(user.admin?).to be(false)
  end

  it "should return 'true' if the user is an admin" do
    admin = FactoryGirl.create(:user, role: "admin")
    expect(admin.admin?).to be(true)
  end
end
