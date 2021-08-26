FactoryBot.define do 
  factory :user do 
      name {"hiro"}
      sequence(:email) { |n| "tanuki#{n}@example.com"}
      password {"password"}
  end 
end 