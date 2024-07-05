class MoviesController < ApplicationController
  def search
    @user = User.find(params[:user_id])
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['api_key'] = Rails.application.credentials.movies[:key]
    end
    @movies = MovieFacade.top_rated_movies

    response = conn.get('/3/discover/movie')
    #https://api.themoviedb.org/3/discover/movie
  end

  def index
    @movies = MovieFacade.top_rated_movies
  end

  def show
    @movies = MovieFacade.top_rated_movies
    require 'pry' ; binding.pry
    @movie 

  end

private

def movie_params
  params.require(:movie).permit(:title, :vote_ave)
end
end
