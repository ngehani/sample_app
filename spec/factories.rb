#Tests to Simulate User model objects - auto loaded by rspec
#Enabled by factory_girl_rails 4.2.1
# Listing 9.31
FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    #Listing 9.41
    factory :admin do
      admin true
    end
  end

  #Listing 10.9
  factory :micropost do
    content "Lorem ipsum"
    user
  end
end