require 'rails_helper'

RSpec.describe 'Movies Index Page', type: :feature do
  describe 'When a user visits user_movies_path(user.id)' do
    describe 'User can find top_rated_movies' do
      before(:each) do
        @user_1 = User.create!(name: 'Jane Doe', email: 'jane@email.com', password: 'test123')

        visit user_discover_movie_path(@user_1)
      end

      it 'Top Rated Movie is a link to Movie Details and displays vote_average', :vcr do
        visit user_movies_path(@user_1, top_rated: true)
        within '.search-results' do
          within '#movie-278' do 
            expect(page).to have_content("Title: The Shawshank Redemption")
            expect(page).to have_link("The Shawshank Redemption")
            expect(page).to have_content("Vote Average: 8.706")
          end
        end
      end

      it 'Each Top Rated Movie is a link that redirects to user_movie_path(user.id)' do
        VCR.use_cassette('Top Rated Movie as link', :record => :new_episodes) do
          # movie_data = attributes_for(:movie)
          # @movie = Movie.new(movie_data)

          visit user_movies_path(@user_1, top_rated: true)
          expect(page).to have_link('The Shawshank Redemption')
          click_on 'The Shawshank Redemption'
          expect(current_path).to eq(user_movie_path(@user_1.id, id: 278)) # How do I do this.
        end
      end

      it 'Has a button to return to Discover Page' do
        VCR.use_cassette('button_to_return_to_Discover_Page', :record => :new_episodes) do
          visit user_movies_path(@user_1, top_rated: true)

          expect(page).to have_button("Discover")
          click_button "Discover"
          expect(current_path).to eq(user_discover_movie_path(@user_1))
        end
      end
    end

    describe 'searched_title', :vcr do
      before(:each) do
        @user_1 = User.create!(name: 'Jane Doe', email: 'jane@email.com', password: 'test123')
        visit user_discover_movie_path(@user_1)
      end

      it 'allows users to search for movie titles' do
        visit user_movies_path(@user_1, search: "Deadpool")

        within '.search-results' do
          within '#movie-293660' do
            expect(page).to have_content('Title: Deadpool')
            expect(page).to have_link('Deadpool')
            expect(page).to have_content('Vote Average: 7.62')
          end
        end
      end
    end
  end
end
