# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    caption "Run Roger"
    text "hello"
    factory(:video) do
      video "https://www.youtube.com/watch?v=eT4LgPwP19o"
    end
    factory(:picture) do
      picture File.new(Rails.root.join('app/assets/images/run.jpg'))
    end
  end
end
