FactoryBot.define do
  factory :comment do
    text { 'Post 1' }
    user_id { nil }
    post_id { nil }
  end
end
