require 'rails_helper'

RSpec.describe 'Movies Index Page', type: :feature do
  describe 'When a user visits user_movies_path(user.id)' do
    describe 'User can find top_rated_movis', :vcr do
      before(:each) do
          @user_1 = User.create!(name: 'Jane Doe', email: 'jane@email.com')

          visit user_discover_movie_path(@user_1)
          click_button 'Discover Top Rated Movies'
          expect(current_path).to eq(user_movies_path(@user_1))
      end

      it 'Top Rated Movie is a link to Movie Details and displays vote_average' do
        within(first(".top_movie")) do 
          expect(page).to have_css(".title")
          expect(page).to have_css(".vote_average")
          expect(page).to have_link("The Shawshank Redemption")
        end
      end

      it 'Each Top Rated Movie is a link that redirects to user_movie_path(user.id)' do
        movie_data = attributes_for(:movie)
        @movie = Movie.new(movie_data)
        expect(page).to have_content("The Shawshank Redemption")
        click_on "The Shawshank Redemption"
        # require 'pry' ; binding.pry
        # expect(current_path).to eq(user_movie_path(@user.id, movie)) # How do I do this.
      end

      it 'Has a button to return to Discover Page' do
        expect(page).to have_button("Discover")
        click_button "Discover"
        expect(current_path).to eq(user_discover_movie_path(@user_1))
      end
    end

    describe 'searched_title', :vcr do
      before(:each) do
        @user_1 = User.create!(name: 'Jane Doe', email: 'jane@email.com')
        visit user_discover_movie_path(@user_1)
        fill_in :search, with: 'Deadpool'
        click_button 'Find Movies'
        expect(current_path).to eq(user_movies_path(@user_1))
      end

      it 'allows users to search for movie titles' do
        within(first(".searched_title")) do 
          expect(page).to have_css('.title')
          expect(page).to have_css('.vote_average')
        end
      end
    end
  end
end
