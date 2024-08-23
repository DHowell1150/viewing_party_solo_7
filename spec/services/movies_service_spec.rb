require 'rails_helper'

RSpec.describe MoviesService do
  it 'can make API call', :vcr do
    params = { language: "en-US", page: 1}
    result = MoviesService.call_api('/3/movie/top_rated')[:results]
    r = result.first
    expect(result).to be_an Array
    expect(r).to be_a Hash
  end
end
