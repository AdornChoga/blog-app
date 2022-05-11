require 'rails_helper'

RSpec.describe "LoginPages", type: :system do
  before do
    driven_by(:rack_test)
  end
  context "Login page content" do
    before(:each){visit "/users/sign_in"}
    it "should have email field" do
      expect(page).to have_content("Email")
    end
    it "should have password field" do
      expect(page).to have_content("Password")
    end
    it "should have login button" do
      expect(page).to have_content("Log in")
    end
  end
end
