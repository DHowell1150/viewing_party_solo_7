require 'rails_helper'

RSpec.describe 'movie search', type: :feature do
  describe 'US1' do
    describe ' as a user when I visit user_discover_movies_path(@user)' do
      before(:each) do
        @user = User.create!(name: Faker::Name.name, email: Faker::Internet.email)
        visit user_discover_movie_path(@user)
      end

      it 'displays button to discover top rated movies' do
        expect(page).to have_button('Discover Top Rated Movies')
      end

      it 'routes to user_movies_path(@user) when discover top rated movies button clicked' do
        click_on 'Discover Top Rated Movies'
        expect(current_path).to eq(user_movies_path(@user))
      end

      it 'displays form to Search for movie by title' do
        expect(page).to have_field(:movie_title)
        expect(page).to have_button('Search by Movie Title')
      end

      it 'routes to user_movies_path(@user) when discover top rated movies button clicked' do
        fill_in :movie_title, with: 'Top Gun'
        click_on 'Search by Movie Title'
        expect(current_path).to eq(user_movies_path(@user))
      end
    end
  end
end
