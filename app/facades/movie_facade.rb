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

  def self.movie_reviews(movie_id)
    params = {language: "en-US", page: 1}
    movie_reviews = MovieServices.call_api("/3/movie/#{movie_id}/reviews", params)
  end
end