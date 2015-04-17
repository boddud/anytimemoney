# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    id 1
    account 1206
    pin 1234
    name "David"
    balance 500.0
  end
end
