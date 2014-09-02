# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    firstname "Mary"
    lastname "Perfect"
    email "maryperfect@challengme.com"
    password "littlelamb"
    password_confirmation "littlelamb"

    factory :fred do
      firstname "Fred"
      lastname "Finstone"
      email "fred@challengme.com"
    end
  end
end
