FactoryBot.define do
  factory :question do
    survey

    title   { Faker::HitchhikersGuideToTheGalaxy.quote }
    kind    { Question.kinds.keys.sample }
    choices { (1..rand(5)).map { Faker::ChuckNorris.fact } }
  end
end
