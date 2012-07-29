FactoryGirl.define do
  factory :user do
    sequence(:nick)  { |n| "Nick#{n}"}
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
  factory :micropost do
    content "Lorem ipsum"
    user
  end
  factory :userToReplyTo, class: User do | user |
    user.name "Donald Duck"
    user.nick "donald"
    user.email "donald@entenhausen.de"
    user.password "foobar"
    user.password_confirmation "foobar"
  end   
  factory :micropost_to_donald do |micropost|
    micropost.content "@donald bla bla bla"
    micropost.user :user
  end
  
end
