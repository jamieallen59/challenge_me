# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    caption "Run Roger"
    picture File.new(Rails.root.join('app/assets/images/run.jpg'))
  end
end
