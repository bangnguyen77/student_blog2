require 'rails_helper'

describe "the sign in process" do
  it "sign a user in" do
    user = User.create(:email => "abc@xyz.com", :password => "password")
    visit new_user_session_path
    fill_in 'Email', :with => 'abc@xyz.com'
    fill_in 'Password', :with => 'password'
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
  end
end
