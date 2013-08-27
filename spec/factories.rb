<<<<<<< HEAD
FactoryGirl.define do
  factory :user do
    name     "Neil Gehani"
    email    "neilg@example.com"
=======
#Tests to Simulate User model objects - auto loaded by rspec
#Enabled by factory_girl_rails 4.2.1
FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
>>>>>>> sign-up
    password "foobar"
    password_confirmation "foobar"
  end
end