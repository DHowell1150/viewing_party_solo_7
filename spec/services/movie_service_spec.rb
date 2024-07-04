require "rails_helper"

RSpec.describe MovieService do
  it "can return Movie data" do
    # #call_db takes two arguments: endpoint and params if there are params
    query = MovieService.call_api('/3/discover/movie')[:results]
    movie = query.first
    expect(query).to be_a(Array)

    #the list of what want to query
    expect(movie[:original_title]).to be_a(String)
    expect(movie[:vote_average]).to be_a(Float)
    expect(movie[:id]).to be_a(Integer)
  end
end
