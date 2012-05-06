Given /^a non signed in user visits the edit user page$/ do
    @user = User.create(name: "Example User", email: "user@example.com",
                      password: "Foobar1", password_confirmation: "Foobar1")
    visit edit_user_path(@user)
end

Then /^he should the edit page title$/ do
  page.should have_selector('title', text: "Edit user")
end

Then /^he should see the edit page header$/ do
  page.should have_selector('h1',    text: "Update your profile")
end

Then /^he should have a link to change gravatar picture$/ do
  page.should have_link('change', href: 'http://gravatar.com/emails')
end

When /^the user clicks the save changes button$/ do
  click_button "Save changes"
end

Then /^he should see an error massage$/ do
  page.should have_selector('div.alert.alert-error')
end

Given /^the user submits valid user information$/ do
  @new_name = "New Name"
  @new_email = "new@example.com"
  fill_in "Name", with: @new_name
  fill_in "Email", with: @new_email
  fill_in "Password", with: @user.password
  fill_in "Confirm Password", with: @user.password
end

Then /^he should see an updated title$/ do
  page.should have_selector('title', text: @new_name)
end

Then /^he should see a success message$/ do
  page.should have_selector('div.alert.alert-success')
end

Then /^he should see a link to sign out$/ do
  page.should have_link('Sign out', href: signout_path)
end

Then /^the user name should be updated in the database$/ do
  @user.reload.name.should == @new_name
end

Then /^the email should be updated in the database$/ do
  @user.reload.email.should == @new_email
end

Given /^a signed in user visits the edit user page$/ do
  @user = User.create(name: "Example User", email: "user@example.com",
                      password: "Foobar1", password_confirmation: "Foobar1")
  visit signin_path
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password 
  click_button "Sign in"
  cookies[:remember_token] = @user.remember_token
  visit edit_user_path(@user)
end

Then /^he should see the signin title$/ do
  page.should have_selector('title', text: 'Sign in')
end

Given /^a userA exists$/ do
  @userA = User.create(name: "Example User", email: "user@example.com",
                      password: "Foobar1", password_confirmation: "Foobar1")
end

Given /^UserB exists$/ do
  @userB = User.create(name: "Second User", email: "second@example.com",
                      password: "Foobar1", password_confirmation: "Foobar1")
end

When /^UserB visits the edit user page of UserA$/ do
  visit signin_path
  fill_in "Email",    with: @userB.email
  fill_in "Password", with: @userB.password 
  click_button "Sign in"
  cookies[:remember_token] = @userB.remember_token
  visit edit_user_path(@userA)
end

Then /^he should not see the edit page title$/ do
  page.should_not have_selector('title', text: "Edit user")
end

When /^he signs in after being redirected to the signing page$/ do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password 
  click_button "Sign in"
  cookies[:remember_token] = @user.remember_token
end


