Given /^a non signed in user visits the users index page$/ do
    visit users_path
end

Then /^he should be redirected to the signing page$/ do
    page.should have_selector('title', text: 'Sign in')
end

Given /^that there are a few users signed up$/ do
    @userA = User.create(name: "Example User", email: "usera@example.com",
                         password: "Foobar1", password_confirmation: "Foobar1")
    @userB = User.create(name: "Example User", email: "userb@example.com",
                         password: "Foobar1", password_confirmation: "Foobar1")
    @userC = User.create(name: "Example User", email: "userc@example.com",
                         password: "Foobar1", password_confirmation: "Foobar1")

end

Given /^one of them is bob@example\.com$/ do
    @userBob = User.create(name: "Bob", email: "bob@example.com",
                         password: "Foobar1", password_confirmation: "Foobar1")

end

When /^bob@example\.com signs in$/ do
    visit signin_path
    fill_in "Email",    with: @userBob.email
    fill_in "Password", with: @userBob.password 
    click_button "Sign in"
    cookies[:remember_token] = @userBob.remember_token
end

When /^visits the users index$/ do
    visit users_path
end

Then /^he should see the user index title$/ do
    page.should have_selector('title', text: 'All users')
end

Then /^he should see all the users listed$/ do
    User.all.each do |user|
        page.should have_selector('li', text: user.name)
    end
end

Given /^that there (\d+) users signed up$/ do |number_of_users|
    number_of_users.to_i.times { FactoryGirl.create(:user) }
end


Then /^he should see the link (.+)$/ do |link|
    should have_link(link)
end

Then /^he should see the first (\d+) users$/ do |number_of_users|
    number = number_of_users.to_i - 1
    User.all[0..number].each do |user|
        page.should have_selector('li', text: user.name)
    end
end

