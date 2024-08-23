class MoviesController < ApplicationController
  def create
    if params[:top_rated]
      # top_movies = MovieFacade.top_rated_movies
      redirect_to user_movies_path(params[:user_id], top_rated: true)
    else
      # searched_title = MovieFacade.search_title(params[:search])
      redirect_to user_movies_path(params[:user_id], search: params[:search])
    end
    # redirect_to user_movies_path(params[:user_id])
  end

  def index
    @user = User.find(params[:user_id])
    if params[:top_rated]
      @top_movies = MovieFacade.top_rated_movies
    elsif params[:search].present?
      @searched_title = MovieFacade.search_title(params[:search])
    else
      @top_movies = []
      @searched_title = []
    end
  end

  def show
    #The line below is where I am erroring out because my ID is a movie object??
    movie_data = MovieFacade.search_title(params[:id])
    @movie = Movie.new(movie_data)
  end
end
