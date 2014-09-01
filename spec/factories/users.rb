# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    firstname "Mary"
    lastname "Perfect"
    email "maryperfect@challengme.com"
    password "littlelamb"
    password_confirmation "littlelamb"
  end
end
