require 'spec_helper'

describe Relationship do

  let(:follower) { FactoryGirl.create(:user) }
  let(:followed) { FactoryGirl.create(:user) }
  let(:relationship) do
    r = Relationship.new()
    r.followed = followed
    r.follower = follower
    r
    #follower.followed_users << followed 
    #follower.relationships.first
  end

  subject { relationship }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to follower_id" do
      expect do
        Relationship.new(follower_id: follower.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
    it "should not allow access to followed_id" do
      expect do
        Relationship.new(followed_id: followed.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end     
  end
  describe "validates" do
    describe "when followed id is not present" do
      before { relationship.followed_id = nil }
      it { should_not be_valid }
    end

    describe "when follower id is not present" do
      before { relationship.follower_id = nil }
      it { should_not be_valid }
    end
  end
  describe "follower methods" do    
     it { should respond_to(:follower) }
     it { should respond_to(:followed) }
     its(:follower) { should == follower }
     its(:followed) { should == followed }
   end
end