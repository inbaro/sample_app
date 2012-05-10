Given /^one of them is bob@example\\\.com$/ do
  @userBob = User.create(name: "Bob", email: "bob@example.com",
                         password: "Foobar1", password_confirmation: "Foobar1")
end

Given /^bob@example\\\.com signs in$/ do
  visit signin_path
  fill_in "Email",    with: @userBob.email
  fill_in "Password", with: @userBob.password
  click_button "Sign in"
  cookies[:remember_token] = @userBob.remember_token
end

When /^he visits the home page$/ do
  visit root_path
end

When /^he presses the "(.*)" button$/ do |button_name|
click_button button_name
end

Then /^the post count should not change$/ do

end

When /^he fills post content with "([^"]*)"$/ do |arg1|

end

Then /^post count should increase by (\d+)$/ do |arg1|

end
