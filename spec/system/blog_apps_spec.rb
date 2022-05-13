require 'rails_helper'

RSpec.describe "BlogApps", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'takes user to profile page after login' do
    user = create(:user)

    visit '/users/sign_in'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content("Signed in successfully")
  end
end
