class MoviesController < ApplicationController
  def search
    @user = User.find(params[:user_id])
    if params[:top_rated]
      @movies = MovieFacade.top_rated
    else
      @movies = MovieFacade.search_title(params[:movie_title]) #method in movie facade
    end
    # redirect_to user_movies_path(@user, @movie)
  end

  def index
    @movies = Movies.all
  end
end
