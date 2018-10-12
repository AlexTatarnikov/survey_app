FactoryBot.define do
  factory :question do
    survey

    title       { Faker::HitchhikersGuideToTheGalaxy.quote }
    kind        { Question.kinds.keys.sample }
    placeholder { Faker::Fallout.quote }
    choices     { (1..rand(5).next).map { Faker::Pokemon.name } }
    required    { true }
  end
end
