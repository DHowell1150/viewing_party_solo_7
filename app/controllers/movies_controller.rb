class MoviesController < ApplicationController
  def search
    # require 'pry' ; binding.pry
    @user = User.find(params[:user_id])
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['api_key'] = Rails.application.credentials.movies[:key]
    end
    @movies = []
    if param[:top_rated]
      @movies = MovieFacade.top_rated_movies
    elsif param[:searched_movie]
      movie_title = Xyz.find(params[:movie_title])
      @movie = MovieFacade.searched_title()#pass in data gathered from the form?
    end
    response = conn.get('/3/discover/movie')
    #https://api.themoviedb.org/3/discover/movie
  end

  # def index
  #   @movies = []
  #   if param[:top_rated]
  #     @movies = MovieFacade.top_rated_movies
  #   end
  # end

  def show
    @user = User.find(params[:user_id])
    @movies = MovieFacade.top_rated_movies
    @movie = @movies.first
  end

private

def movie_params
  params.require(:movie).permit(:title, :vote_ave)
end
end
