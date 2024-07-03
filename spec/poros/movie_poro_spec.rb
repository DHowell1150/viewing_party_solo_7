require "rails_helper"

RSpec.describe Movie do
  before do
    
    attrs = {

    }
    @movie = Movie.new(attrs)
  end
  it "exists and has attrs" do
    expect(@movie).to be_a(Movie)
  #   expect(@movie.name).to eq("Leslie Knope")
  #   expect(@movie.party).to eq("pizza")
  #   expect(@movie.state).to eq("Utah")
  # end
end
