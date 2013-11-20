FactoryGirl.define do
  factory :user do
    name  'Anakin Skywalker'
    email 'anakin.skywalker@sw.com'
    password 'theforce'
    password_confirmation 'theforce'
  end
end
