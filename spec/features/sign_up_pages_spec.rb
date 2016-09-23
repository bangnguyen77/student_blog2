require 'rails_helper'

describe "the sign up process" do
  it "creates a new user" do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', :with => 'xyz@gmail.com'
    fill_in 'user_password', :with => 'password'
    fill_in 'user_password_confirmation', :with => 'password'
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
