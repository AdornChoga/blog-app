FactoryBot.define do
  factory :comment do
    text { 'Post 1' }
    user_id { 1 }
    post_id { 1 }
  end
end
