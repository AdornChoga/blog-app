require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = FactoryBot.create(:user)
  post = FactoryBot.create(:post, user_id: user.id)
  comment = FactoryBot.create(:comment, user_id: user.id, post_id: post.id)

  describe 'Validations' do
    it 'is not valid without text attribute' do
      comment.text = nil
      expect(comment).to_not be_valid
    end

    it 'is not valid when text is greater than 250 characters' do
      comment.text = 'a' * 256
      expect(comment).to_not be_valid
    end
  end

  describe 'Methods' do
    it 'increments comments counter of post' do
      comment.update_comments_counter(post)
      expect(post.comments_counter).to eq(1)
    end
  end
end
