require 'rails_helper'

RSpec.describe MovieFacade do
  it "finds top rated movies" do
    top_movies = MovieFacade.top_rated_movies
    movie = top_movies.first

    expect(top_movies).to be_a(Array)
    expect(top_movies.count).to be(20)
    expect(movie.title).to be_a(String)
    expect(movie.vote_ave).to be_a(Float)
    expect(movie.id).to be_a(Integer)
  end

  it "finds top rated movies" do
    movie_id = 278

    movie_review = MovieFacade.movie_reviews(movie_id)
    # movie_review = movie_reviews.first
    # expect(movie_reviews).to be_a(Array)
    # expect(movie_review).to be_a(Hash)
    # expect(movie_reviews.count).to eq(13)
    # expect(movie_reviews[:author]).to be_a(String)
    # expect(movie_reviews[:author_details]).to be_a(Hash)
    # expect(movie_reviews[:author_details][:username]).to be_a(String)
    # expect(movie_reviews[:author_details][:avatar_path]).to be_a(String || nil) ( if runtime.nil? return "N/A")
    # expect(movie_reviews[:author_details][:rating]).to be_a(Float)
  end
end
