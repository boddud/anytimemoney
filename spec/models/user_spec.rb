require 'spec_helper'

describe User do
  it "Factory girl is created" do
    # @user = FactoryGirl.create(:user)
    # @user.save
  end
  it "returns valid user if account exists" do
    @user=User.find_by_account(1206)
   
    expect(@user).to be_an_instance_of User
    expect(@user.account).to eq 1206
    expect(@user.name).to eq "David"
  end
  it "returns a valid user if account is valid" do
    @user=User.find_by_account(1206)
    expect(@user.account).to eq 1206
    
  end
end
