require 'spec_helper'

describe "Static pages" do
 
  subject { page }
  
  shared_examples_for "all static pages" do
    it { should have_selector('h1',    text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Home page"do
    before { visit root_path }
    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }
    it_should_behave_like "all static pages"
   it { should_not have_selector('title', :text => '| Home') }
   
   it "should have the right links on the layout" do
     page.should have_selector 'h1', text: 'Sample App'
     click_link "About"
     page.should have_selector 'title', text: full_title('About Us')
     click_link "Help"
     page.should have_selector 'title', text: full_title('Help')
     click_link "Contact"
     page.should have_selector 'title', text: full_title('Contact')
     click_link "Home"
     page.should have_selector 'h1', text: 'Sample App'
     click_link "Sign up now"
     #save_and_open_page
     page.should have_selector 'h1', text: 'Sign up'
     click_link "sample app"
     page.should have_selector 'h1', text: 'Sample App'
    end
    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        sign_in user
        visit root_path
      end
      describe "it should show the nick/handle" do
        it { should have_selector 'span', text: user.handle}
      end
      describe "follower/following counts" do
         let(:other_user) { FactoryGirl.create(:user) }
         before do
           other_user.follow!(user)
           visit root_path
         end

         it { should have_link("0 following", href: following_user_path(user)) }
         it { should have_link("1 followers", href: followers_user_path(user)) }
       end
       
      
      describe "with more than one micropost" do
        before do
          FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
          FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
          visit root_path
        end
        it "should render the user's feed" do
          user.feed.each do |item|
            page.should have_selector("li##{item.id}", text: item.content)
          end
        end
        it "should show the number of microposts" do
          page.should have_selector 'span', text: '2 microposts'
        end
        it "should show the nicks" do
          user.feed.each do |item|
            page.should have_selector("li##{item.id}", text: item.user.handle)
          end
        end
        
       end
      describe "with no microposts" do
        it "should show the number of microposts" do
          page.should have_selector 'span', text: '0 microposts'
        end
      end
      describe "with exactly one micropost" do
        before do
           FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
           visit root_path
         end
        it "should show the number of microposts" do
          page.should have_selector 'span', text: '1 micropost'
        end
      end
      describe "with a lot of microposts" do
        before do
          1.upto(50) { |i|
            FactoryGirl.create(:micropost, user: user, 
            content: "Lorem ipsum #{i}") }
          visit root_path
        end
        #<%= will_paginate @feed_items %>
        
        describe "should paginate the feed" do
          it "containing all items" do
            user.feed.paginate(page: 1).each do |item|
              page.should have_selector('li', text: item.content)
            end
          end
          it "by showing 30 items on a page" do
            page.should match_exactly(30,'li.feed_item')
          end
          it "and show the page navigator" do
            page.should have_selector('div.pagination')
          end
        end
  
      end

     end
  end

  describe "Help page" do
    before { visit help_path }
     let(:heading)    { 'Help' }
     let(:page_title) { 'Help' }
     it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path}
     let(:heading)    { 'About Us' }
     let(:page_title) { 'About Us' }
     it_should_behave_like "all static pages"
  end
  
  describe "Contact page" do
    before { visit contact_path }
     let(:heading)    { 'Contact' }
     let(:page_title) { 'Contact' }
     it_should_behave_like "all static pages"
  end
end