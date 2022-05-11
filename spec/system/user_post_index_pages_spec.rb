require 'rails_helper'

RSpec.describe 'UserPostIndexPages', type: :system do
  before do
    driven_by(:rack_test)
  end

  before(:each) do
    @user = create(:user, name: 'James')
    login_as @user
    @other_user = create(:user, name: 'Jane')
    (1..6).each { |n| create(:post, user_id: @other_user.id, title: "Post #{n}") }
    @other_user.posts.each { |post| create(:comment, post_id: post.id, user_id: @user.id) }
    visit "/users/#{@other_user.id}/posts"
  end

  describe 'Page content' do
    it "should have other user's profile picture" do
      expect(page).to have_css("img[src*='#{@other_user.photo}']")
    end
    it 'should have username of other user' do
      expect(page).to have_content(@other_user.name)
    end
    it 'should have number of posts of other user' do
      expect(page).to have_content("Number of posts: #{@other_user.posts_counter}")
    end
    it "should display a posts's title" do
      expect(page).to have_content(@other_user.posts.first.title)
    end
    it "should display a posts's body" do
      expect(page).to have_content(@other_user.posts.first.text)
    end
    it "should display a post's comments" do
      comment = @other_user.posts.first.comments.where(user_id: @user).first
      expect(page).to have_content("#{@user.name}: #{comment.text}")
    end
    it "should display a post's comments count" do
      post = @other_user.posts.first
      expect(page).to have_content("Comments: #{post.comments_counter}")
    end
    it "should display a post's likes count" do
      post = @other_user.posts.first
      expect(page).to have_content("Likes: #{post.likes_counter}")
    end
    it 'should display a pagination section' do
      expect(page).to have_content('Pagination')
    end
  end

  describe 'Interactions' do
    it "should redirect to to clicked post's show page" do
      post = @other_user.posts.first
      click_link(post.id.to_s)
      expect(page).to have_current_path("/users/#{@other_user.id}/posts/#{post.id}")
    end
  end
end
