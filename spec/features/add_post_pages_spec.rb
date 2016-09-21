require 'rails_helper'

describe "the add a post process" do
  it "adds a new post" do
    user = User.create(:email => "abc@xyz.com", :password => "password")
    post = FactoryGirl.create(:post, :user_id => user.id)
    visit new_user_session_path
    fill_in 'Email', :with => 'abc@xyz.com'
    fill_in 'Password', :with => 'password'
    click_on 'Sign In'
    click_on "New Post"
    fill_in "Title", :with => "First post"
    fill_in "Content", :with => "Blah aha"
    click_on "Create Post"
    expect(page).to have_content "Blah aha"
  end

  it "gives an error if a field is blank" do
    user = User.create(:email => "abc@xyz.com", :password => "password")
    post = FactoryGirl.create(:post, :user_id => user.id)
    visit new_user_session_path
    fill_in 'Email', :with => 'abc@xyz.com'
    fill_in 'Password', :with => 'password'
    click_on 'Sign In'
    click_on "New Post"
    visit edit_post_path(post)
    fill_in "Image", :with => ""
    click_on "Create Post"
    expect(page).to have_content 'errors'
  end
end
