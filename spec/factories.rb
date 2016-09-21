FactoryGirl.define do
  factory(:post) do
    title('sensational post')
    content('something')
    user
  end
end
FactoryGirl.define do
  factory :user do
    username('abc')
    email('abc@xyz.com')
    password('123456')
  end
end
