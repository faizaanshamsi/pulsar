FactoryGirl.define do

  factory :user do
    sequence(:github_uid) { |n| "1234#{n}" }
    name 'foo'
    sequence(:display_name) { |n| "username #{n}" }
  end

  factory :learning do
    user
    content 'awesome stuff'
  end

  factory :like do
    user
    learning
  end

end
