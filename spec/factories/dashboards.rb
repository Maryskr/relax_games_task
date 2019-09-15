FactoryBot.define do
  factory :dashboard do
    title { Faker::TvShows::Simpsons.character }
    description { Faker::TvShows::Simpsons.quote }
  end
end
