# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pledge do
  	name	"sausage_challenge"
    caption "Wet Suit Challenge"
    amount 300
    text "I will do a training run in my wetsuit"
  end
end
