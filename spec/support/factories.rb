FactoryGirl.define do

  factory :user do
    github_uid '1234'
    name 'foo'
    display_name 'foo'
    gravatar 'http://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50'
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
