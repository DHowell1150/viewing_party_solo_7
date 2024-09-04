class MovieFacade
  def self.top_rated_movies
    params = { language: "en-US", page: 1 }
    top_movies = MoviesService.call_api('/3/movie/top_rated', params)[:results]
    top_movies.map do |movie|
      Movie.new(movie)
    end
  end

  def self.search_title(title)
    params = { query: title }
    movies = MoviesService.call_api("/3/search/movie", params)[:results]
    movies.map do |movie| #refactor this
      Movie.new(movie)
    end
  end
end
