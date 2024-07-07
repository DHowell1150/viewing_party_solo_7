class MovieFacade
  def self.top_rated_movies
    #since there are params I put them here for call_db
    params = {language: "en-US", page: 1}
    #These are the params in api docs

    top_rated_movies = MovieService.call_api('3/movie/top_rated', params)[:results]

    top_rated_movies.map do |movie|
      Movie.new(movie)
      #now make a PORO 
    end
  end

  def self.searched_title(movie_title)
    params = {title: movie_title}
    searched_movie = MovieService.call_api('/3/discover/movie')

    movie_title_search
  end

  def self.movie_reviews(movie_id)
    # movie_id = 278
    params = {language: "en-US", page: 1}
    movie_reviews = MovieService.call_api("/3/movie/#{movie_id}/reviews", params)[:results]
    movie_review = movie_reviews.first
  end
end
