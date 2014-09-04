# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "Bigfoot Race"
    event_date Date.new(2014, 9, 12)
    charity "Red Cross"
    target 1000
    amount_raised 10.0
    training 4
    jg_event_id 1
    jg_short_name 'bigfoot'
  end
end
