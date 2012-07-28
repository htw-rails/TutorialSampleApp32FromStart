# changes here require restart of guard
include ApplicationHelper

# seems not to be used, keep it until finished tutorial
#def valid_signin(user)
#  fill_in "Email",    with: user.email
#  fill_in "Password", with: user.password
#  click_button "Sign in"
#end

def sign_in(user)
  visit signin_path 
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end

# http://stackoverflow.com/questions/6729134/how-to-assert-number-of-elements-using-capybara-with-proper-error-message
RSpec::Matchers.define :match_exactly do |expected_match_count, selector|
    match do |context|
        matching = context.all(selector)
        @matched = matching.size
        @matched == expected_match_count
    end

    failure_message_for_should do
        "expected '#{selector}' to match exactly #{expected_match_count} elements, but matched #{@matched}"
    end

    failure_message_for_should_not do
        "expected '#{selector}' to NOT match exactly #{expected_match_count} elements, but it did"
    end
end