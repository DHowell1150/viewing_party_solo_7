require 'rails_helper'

RSpec.describe 'Movies Show Page', type: :feature do
  describe 'When a user visits  user_movie_path(user.id, movie.id)' do
    describe 'User can see details of movie', :vcr do
      before(:each) do
        @user_1 = create(:user)
        movie_data = attributes_for(:movie)
        @movie = Movie.new(movie_data) #=> #<Movie:0x000000012137a790 @id=278, @title="The Shawshank Redemption", @vote_average=8.7>
        visit user_discover_movie_path(@user_1)
        click_button 'Discover Top Rated Movies'
        expect(current_path).to eq(user_movies_path(@user_1))
        expect(page).to have_link(@movie.title)
        
        click_link "#{@movie.title}"
        require 'pry' ; binding.pry
        expect(current_path).to eq(user_movie_path(@user_1, @movie))
      end

      it 'Top Rated Movie is a link to Movie Details and displays vote_average' do
        within(first(".top_movie")) do 
          expect(page).to have_css(".title")
          expect(page).to have_css(".vote_average")
          expect(page).to have_link(@movie.title) 
        end
      end

      it 'Each Top Rated Movie is a link that redirects to user_movie_path(user.id)' do
        movie = create(:movie)
        click_on "The Shawshank Redemption"
        # require 'pry' ; binding.pry
        # expect(current_path).to eq(user_movie_path(@user.id, movie)) # How do I do this.
      end

      it 'Has a button to Create Viewing Party' do
        expect(page).to have_button("Discover")
        click_button "Discover"
        expect(current_path).to eq(user_discover_movie_path(@user_1))
      end
    end
  end
end
