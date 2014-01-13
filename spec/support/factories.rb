FactoryGirl.define do

  factory :user do
    github_uid '1234'
    name 'foo'
    display_name 'foo'
  end

  factory :learning do
    user
    content 'awesome stuff'
  end

end
