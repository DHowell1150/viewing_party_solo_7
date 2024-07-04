require 'rails_helper'

RSpec.describe MovieFacade do
  it "finds top rated movies" do
    movies = MovieFacade.top_rated_movies
    movie = movies.first
    
    expect(movies).to be_a(Array)
    expect(movies.count).to be(20)
    expect(movie.title).to be_a(String)
    expect(movie.vote_ave).to be_a(Float)
    expect(movie.id).to be_a(Integer)
  end
end
