class MovieFacade
  def self.top_rated_movies
    #since there are params I put them here for call_db
    params = {language: "en-US", page: 1}
    #These are the params in api docs

    top_rated_movies = MovieService.call_api('3/movie/top_rated', params)[:results]

    top_rated_movies.map do |movie|
      Movie.new(movie)
      #need to make a PORO
    end
  end
end
