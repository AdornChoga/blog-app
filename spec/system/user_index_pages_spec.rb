require 'rails_helper'

RSpec.describe 'UserIndexPages', type: :system do
  before do
    driven_by(:rack_test)
  end

  before(:each) do
    @user = create(:user, name: 'James')
    visit '/users/'
  end

  context 'Page content' do
    it 'should have username of all other users' do
      expect(page).to have_content(@user.name)
    end
    it 'should have the images' do
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end
    it 'should have number of users posts' do
      expect(page).to have_content("Number of posts: #{@user.posts_counter}")
    end
    it "should redirect to clicked user's show page" do
      login_as(@user)
      click_link 'View Profile'
      expect(page).to have_current_path("/users/#{@user.id}")
    end
  end
end
