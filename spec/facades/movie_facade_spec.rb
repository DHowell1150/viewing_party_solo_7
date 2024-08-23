require 'rails_helper'

RSpec.describe MovieFacade do
    it 'can return top_rated_movies', :vcr do
      top_rated_response = MovieFacade.top_rated_movies
      r      = top_rated_response.first

      expect(top_rated_response).to be_an(Array)
      expect(r).to be_a(Movie)
      expect(r.id).to be_an(Integer)
      expect(r.title).to be_a(String)
      expect(r.vote_average).to be_a(Float)
    end

    it 'can return titles from search' do
      results = MovieFacade.search_title("Deadpool")
      r =       results.first
      expect(r).to be_a(Movie)
      expect(r.id).to be_an(Integer)
      expect(r.title).to be_a(String)
      expect(r.vote_average).to be_a(Float)
    end
end
