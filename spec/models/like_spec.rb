require 'rails_helper'

RSpec.describe Like, type: :model do
  user = FactoryBot.create(:user)
  post = FactoryBot.create(:post, user_id: user.id)
  like = FactoryBot.create(:like, user_id: user.id, post_id: post.id)

  describe 'Validations' do
    it 'is not valid without text attribute' do
      like.user_id = nil
      expect(like).to_not be_valid
    end

    it 'is not valid when text is greater than 250 characters' do
      like.post_id = nil
      expect(like).to_not be_valid
    end
  end

  describe 'Methods' do
    it 'increments likes counter of post' do
      like.update_likes_counter(post)
      expect(post.likes_counter).to eq(1)
    end
  end
end
