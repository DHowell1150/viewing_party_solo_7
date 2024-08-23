require 'rails_helper'
RSpec.describe do
  it "exists and has attribute" do
    incoming_data =    {
      "adult": false,
      "backdrop_path": "/avedvodAZUcwqevBfm8p4G2NziQ.jpg",
      "genre_ids": [
          18,
          80
      ],
      "id": 278,
      "original_language": "en",
      "original_title": "The Shawshank Redemption",
      "overview": "Imprisoned in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
      "popularity": 162.491,
      "poster_path": "/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg",
      "release_date": "1994-09-23",
      "title": "The Shawshank Redemption",
      "video": false,
      "vote_average": 8.7,
      "vote_count": 26664
    }

    movie = Movie.new(incoming_data)
    expect(movie).to be_a(Movie)
    expect(movie.title).to be_a(String)
    expect(movie.id).to be_a(Integer)
    expect(movie.vote_average).to be_a(Float)
  end
end
