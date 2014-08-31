# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name ""
    event_date ""
    charity ""
    target ""
    amount_raised 1.5
  end
end
