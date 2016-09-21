require 'rails_helper'

describe 'the delete a post process' do
  it 'deletes a post' do
    user = User.create(:email => "abc@xyz.com", :password => "password")
    post = FactoryGirl.create(:post, :user_id => user.id)
    visit new_user_session_path
    fill_in 'Email', :with => 'abc@xyz.com'
    fill_in 'Password', :with => 'password'
    click_on 'Sign in'
    visit post_path(post)
    click_on 'Delete'
    expect(page).to have_no_content(post.title)
  end
end
