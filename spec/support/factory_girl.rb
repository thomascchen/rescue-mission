require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :question do
    sequence(:title) { |n| "Question #{n}" * 10 }
    description "Great Question" * 30
  end

end
