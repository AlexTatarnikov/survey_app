FactoryBot.define do
  factory :admin do
    sequence(:email) { |n| "#{n}#{Faker::Internet.email}" }
    password   { 'password' }
  end
end
