require 'rails_helper'

RSpec.describe MovieService do
  it 'can make API call to database', :vcr do
    # params = {}
    movies = MovieService.call_db('discover/movie')[:results]
    movie = movies.first

    expect(movies).to be_an Array
    expect(movie).to be_a Hash
    expect(movie[:original_title]).to be_a String
    expect(movie[:vote_average]).to be_a Float
  end
end

#from postman
# https://api.themoviedb.org/3/discover/movie?api_key=12e6e5a5464d2d0219f27f0ae35dd258
