require 'rails_helper'

describe "the sign out process" do
  it "sign a user out" do
    user = User.create(:email => "abc@xyz.com", :password => "password")
    visit new_user_session_path
    fill_in 'Email', :with => 'abc@xyz.com'
    fill_in 'Password', :with => 'password'
    click_button 'Sign in'
    click_link 'Sign Out'
    expect(page).to have_content 'Signed out successfully'
  end
end
