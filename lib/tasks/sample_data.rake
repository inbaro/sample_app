namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Inbar Oren",
                 email: "inbar@agilesparks.com",
                 password: "Foobar1",
                 password_confirmation: "Foobar1")
   admin.toggle!(:admin)
   User.create!(name: "Yuval Yeret",
                 email: "yuval@agilesparks.com",
                 password: "Foobar1",
                 password_confirmation: "Foobar1")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "Password1"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
  end
end
