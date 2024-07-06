require "rails_helper"

RSpec.describe MovieService do
  it "can return title, vote average, id" do
    # #call_db takes two arguments: endpoint and params if there are params
    query = MovieService.call_api('/3/discover/movie')[:results]
    movie = query.first
    expect(query).to be_a(Array)
    expect(movie).to be_a(Hash)

    #the list of what want to query
    expect(movie[:original_title]).to be_a(String)
    expect(movie[:vote_average]).to be_a(Float)
    expect(movie[:id]).to be_a(Integer)
  end

  it "can get review data from review endpoint" do
    movie_id = 278
    params = {language: "en-US", page: 1}
    query = MovieService.call_api("/3/movie/#{movie_id}/reviews", { language: 'en-US', page: 1 })
    # movie = query.first
    # expect(query).to be_a(Array)

    # #the list of what want to query
    # expect(movie[:original_title]).to be_a(String)
    # expect(movie[:vote_average]).to be_a(Float)
    # expect(movie[:id]).to be_a(Integer)
  end
end
