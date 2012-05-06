Given /^a user visits the signin page$/ do
  visit signin_path
end

When /^he submits invalid signin information$/ do
  click_button "Sign in"
end

Then /^he should see an error message$/ do
  page.should have_selector('div.alert.alert-error')
end

Given /^the user has an account$/ do
  @user = User.create(name: "Example User", email: "user@example.com",
                      password: "Foobar1", password_confirmation: "Foobar1")
end

When /^the user submits valid signin information$/ do
  visit signin_path
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password 
  click_button "Sign in"
  cookies[:remember_token] = @user.remember_token
end

Then /^he should see his profile page$/ do
  page.should have_selector('title', text: @user.name)
end

Then /^he should see a signout link$/ do
  page.should have_link('Sign out', href: signout_path)
end

Then /^he should see a settings link$/ do
    page.should have_link('Settings', href: edit_user_path(@user))
end

Then /^he should see a users index link$/ do
    page.should have_link('Users', href: users_path)
end
