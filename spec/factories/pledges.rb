# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pledge do
    title "MyString"
    amount 1
    info "MyText"
  end
end
