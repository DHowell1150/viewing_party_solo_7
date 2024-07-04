class MovieService 
  #COPY THIS
  # Only thing to change is key and url
  def self.call_api(endpoint, params = {})
    response = conn.get(endpoint) do |request|
      # params and api key will now get passed in the request
      request.params = params
      request.params[:api_key] = Rails.application.credentials.movies[:key]
    end
    parse_data(response)
  end

  private

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org')
  end

  def self.parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
