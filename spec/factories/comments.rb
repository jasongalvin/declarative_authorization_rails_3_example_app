# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    article_id 1
    author_name "MyString"
    site_url "MyString"
    content "MyText"
    user_id 1
  end
end
