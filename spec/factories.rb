
#Tests to Simulate User model objects - auto loaded by rspec
#Enabled by factory_girl_rails 4.2.1
FactoryGirl.define do
  factory :user do
    name     "Neil Gehani"
    email    "user@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end