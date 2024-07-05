require "rails_helper"

RSpec.describe Movie do
  it "exists and has attributes" do
    movie_data = {
      "adult": false,
      "backdrop_path": "/wNAhuOZ3Zf84jCIlrcI6JhgmY5q.jpg",
      "genre_ids": [
          28,
          12,
          878
        ],
      "id": 786892,
      "original_language": "en",
      "original_title": "Furiosa: A Mad Max Saga",
      "overview": "As the world fell, young Furiosa is snatched from the Green Place of Many Mothers and falls into the hands of a great Biker Horde led by the Warlord Dementus. Sweeping through the Wasteland they come across the Citadel presided over by The Immortan Joe. While the two Tyrants war for dominance, Furiosa must survive many trials as she puts together the means to find her way home.",
      "popularity": 4806.719,
      "poster_path": "/iADOJ8Zymht2JPMoy3R7xceZprc.jpg",
      "release_date": "2024-05-22",
      "title": "Furiosa: A Mad Max Saga",
      "video": false,
      "vote_average": 7.715,
      "vote_count": 1668
    }

    movie = Movie.new(movie_data)
    expect(movie).to be_a(Movie)
    expect(movie.title).to be_a(String)
    expect(movie.vote_ave).to be_a(Float)
  end
end