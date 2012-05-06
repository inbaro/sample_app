FactoryGirl.define do
    factory :user do
        sequence(:name)  { |n| "Person #{n}" }
        sequence(:email) { |n| "person_#{n}@example.com"}   
        password "Foobar1"
        password_confirmation "Foobar1"
        
        factory :admin do
            admin true
        end
    end
end