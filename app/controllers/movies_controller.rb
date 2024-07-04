class MoviesController < ApplicationController
  def search
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['api_key'] = Rails.application.credentials.movies[:key]
    end

    response = conn.get('/3/discover/movie')
    #https://api.themoviedb.org/3/discover/movie
  end
end
