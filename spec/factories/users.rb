FactoryBot.define do
  factory :user do
    name { 'John' }
    photo { 'https://randomuser.me/api/portraits/women/60.jpg' }
    bio { "I'm a Footballer" }
    posts_counter { 0 }
  end
end
