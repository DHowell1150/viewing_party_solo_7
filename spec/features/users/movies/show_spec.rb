require 'rails_helper'

RSpec.describe 'Movies Show Page', type: :feature do
  describe 'When a user visits  user_movie_path(user.id, movie.id)' do
    describe 'User can see details of movie', :vcr do
      before(:each) do
        @user_1 = create(:user)
        movie_data = attributes_for(:movie)
        @movie = Movie.new(movie_data) #=> #<Movie:0x000000012137a790 @id=278, @title='The Shawshank Redemption", @vote_average=8.7>

        visit user_discover_movie_path(@user_1)
      end

      xit 'Top Rated Movie is a link to Movie Details and displays vote_average' do
        click_button 'Discover Top Rated Movies'
        expect(current_path).to eq(user_movies_path(@user_1))
        expect(page).to have_link(@movie.title)

        click_link "#{@movie.title}"
        expect(current_path).to eq(user_movie_path(@user_1, @movie.id))
        within '.search-results' do
          within '#movie-278' do
            expect(page).to have_content('Title: The Shawshank Redemption')
            expect(page).to have_content('Vote Average: 8.706')
            expect(page).to have_link('The Shawshank Redemption')
          end
        end
      end

      xit 'Each Top Rated Movie is a link that redirects to user_movie_path(user.id)' do
        movie = create(:movie)
        click_button 'Discover Top Rated Movies'
        expect(current_path).to eq(user_movies_path(@user_1))
        expect(page).to have_link(@movie.title)

        click_link "#{@movie.title}"
        expect(current_path).to eq(user_movie_path(@user_1, @movie))
        click_on 'The Shawshank Redemption'
        # require 'pry' ; binding.pry
        # expect(current_path).to eq(user_movie_path(@user.id, movie)) # How do I do this.
      end

      xit 'Has a button to Create Viewing Party' do
        expect(page).to have_button('Discover')
        click_button 'Discover'
        expect(current_path).to eq(user_discover_movie_path(@user_1))
      end
    end
  end
end
