FactoryBot.define do
  factory :user do
    name { 'John' }
    email { "john#{rand 10_000}@example.com" }
    photo { 'https://randomuser.me/api/portraits/women/60.jpg' }
    bio { "I'm a Footballer" }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { DateTime.now }
  end
end
