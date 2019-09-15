15.times do
  Dashboard.create!(
    title: Faker::TvShows::Simpsons.character,
    description: Faker::TvShows::Simpsons.quote)
end
