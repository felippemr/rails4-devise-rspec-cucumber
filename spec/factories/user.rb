FactoryGirl.define do
  factory :user do
    name  'Anakin Skywalker'
    email 'anakin.skywalker@sw.com'
    password 'theforce'
    password_confirmation 'theforce'
    confirmed_at Time.now
  end
end
