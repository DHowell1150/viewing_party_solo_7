class Movie
  attr_reader :title, :vote_ave, :id

  def initialize(movie_data)
    @title = movie_data[:original_title]
    @vote_ave = movie_data[:vote_average]
    @id = movie_data[:id]
  end
end
