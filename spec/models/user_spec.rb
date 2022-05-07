require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.create(
      name: 'John',
      photo: 'https://randomuser.me/api/portraits/women/60.jpg',
      bio: "I'm a Footballer",
      posts_counter: 0
    )
  end
  describe 'Validations' do
    it 'is not valid without a name attribute' do
      user.name = nil
      expect(user).to_not be_valid
    end

    it 'is not valid with post_counter less than 0' do
      user.posts_counter = -1
      expect(user).to_not be_valid
    end

    it 'is valid with integer posts_counter' do
      user.posts_counter = 1
      expect(user.posts_counter).to be_integer
    end
  end
end
