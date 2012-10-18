# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :events_user do
    event_id 1
    user_id 1
    attending false
    comment "MyString"
    stuff "MyString"
  end
end
