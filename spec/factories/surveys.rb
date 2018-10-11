FactoryBot.define do
  factory :survey do
    sequence(:title) { |n| "#{Faker::DrWho.the_doctor} ##{n}" }
    subtitle { Faker::DrWho.quote }
  end
end
