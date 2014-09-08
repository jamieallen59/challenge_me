# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :challenge do
    creator "Mike"
    name "Pour water on your head and i'll give you £5"
    amount 50
  end

  factory :challenge_bob do
  	creator "Bob"
    name "Do the colesaw challenge, eat 1KG of colesaw in 1 hour and i'll give you £100"
    amount 100
  end
end
