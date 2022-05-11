FactoryBot.define do
  factory :user do
    name { 'Adorn' }
    sequence(:email) { |n| "#{name.downcase}#{n}@test.com" }
    photo { 'https://randomuser.me/api/portraits/women/60.jpg' }
    bio { "I'm a Software Developer" }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { DateTime.now }
  end
end
