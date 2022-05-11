FactoryBot.define do
  factory :post do
    title { 'post1' }
    text { 'lorem ipsum' }
    user_id { nil }
  end
end
