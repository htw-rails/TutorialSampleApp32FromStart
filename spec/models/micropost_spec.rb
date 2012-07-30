require 'spec_helper'

describe Micropost do

  let(:user) { FactoryGirl.create(:user) }
  before { @micropost = user.microposts.build(content: "Lorem ipsum") }

  subject { @micropost }

  it { should respond_to(:content) }
  it { should respond_to(:user) }
  it { should respond_to(:to)}
  
  
  its(:user) { should == user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @micropost.user_id = nil }
    it { should_not be_valid }
  end
  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Micropost.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end
  describe "when user_id is not present" do
     before { @micropost.user_id = nil }
     it { should_not be_valid }
   end

   describe "with blank content" do
     before { @micropost.content = " " }
     it { should_not be_valid }
   end

   describe "with content that is too long" do
     before { @micropost.content = "a" * 141 }
     it { should_not be_valid }
   end
   
   describe "replies" do
     before(:each) do
       @reply_to_user = FactoryGirl.create(:userToReplyTo)
       @micropost = user.microposts.create(content: "#{@reply_to_user.handle} look a reply to Donald")
     end
     it "should identify a @user and set the in_reply_to field accordingly" do
       @micropost.to.should == @reply_to_user
     end
   end
   describe "from_users_followed_by_including_replies" do

   before(:each) do
     @other_user = FactoryGirl.create(:user, :email => FactoryGirl.generate(:email))
     @third_user = FactoryGirl.create(:user, :email => FactoryGirl.generate(:email))

     @user_post  = @user.microposts.create!(:content => "foo")
     @other_post = @other_user.microposts.create!(:content => "bar")
     @third_post = @third_user.microposts.create!(:content => "baz")

     @userToReplyTo = FactoryGirl.create(:userToReplyTo)
     @forth_post = @third_user.microposts.create!(:content => "@#{@userToReplyTo.shorthand} baz")

     @user.follow!(@other_user)
 
     it "should have a from_users_followed_by class method" do
       Micropost.should respond_to(:from_users_followed_by_including_replies)
     end
   
     it "should include the followed user's microposts" do
       Micropost.from_users_followed_by_including_replies(@user).should include(@other_post)
     end
   
     it "should include the user's own microposts" do
       Micropost.from_users_followed_by_including_replies(@user).should include(@user_post)
     end
   
     it "should not include an unfollowed user's microposts" do
       Micropost.from_users_followed_by_including_replies(@user).should_not include(@third_post)
     end
   
     it "should include posts to user" do
       Micropost.from_users_followed_by_including_replies(@userToReplyTo).should include(@forth_post)
     end
   end
   
  end
end