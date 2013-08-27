FactoryGirl.define do
  factory :user do
    name     "Neil Gehani"
    email    "neilg@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end