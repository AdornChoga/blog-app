FactoryBot.define do
  factory :post do
    title { 'post1' }
    text { 'lorem ipsum' }
    user_id { nil }
    comments_counter { 0 }
    likes_counter { 0 }
  end
end
