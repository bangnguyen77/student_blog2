require 'rails_helper'

describe 'the edit a post process' do
  it 'edits a post' do
    user = User.create(:email => "abc@xyz.com", :password => "password")
    post = FactoryGirl.create(:post, :user_id => user.id)
    visit new_user_session_path
    fill_in 'Email', :with => 'abc@xyz.com'
    fill_in 'Password', :with => 'password'
    click_on 'Sign in'
    visit edit_post_path(post)
    fill_in "Title", :with => "Kul heading"
    fill_in "Content", :with => "Hot text"
    click_on "Update Post"
    expect(page).to have_content "Kul heading"
  end

  it "gives an error if a field is blank" do
    user = User.create(:email => "abc@xyz.com", :password => "password")
    post = FactoryGirl.create(:post, :user_id => user.id)
    visit new_user_session_path
    fill_in 'Email', :with => 'abc@xyz.com'
    fill_in 'Password', :with => 'password'
    click_on 'Sign in'
    visit edit_post_path(post)
    fill_in "Title", :with => ""
    click_on "Update Post"
    expect(page).to have_content 'error'
  end
end
