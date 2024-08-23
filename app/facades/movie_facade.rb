class MovieFacade
  def self.top_rated_movies
    top_movies = MoviesService.call_api('/3/movie/top_rated')[:results]
    top_movies.map do |movie|
      Movie.new(movie)
    end
  end

  def self.search_title(title)
    movies = MoviesService.call_api("/3/search/movie?query=#{title}")[:results] #look at docs: how to pass in params
    movie = movies.map do |movie| #refactor this
      Movie.new(movie)
    end
  end
end
