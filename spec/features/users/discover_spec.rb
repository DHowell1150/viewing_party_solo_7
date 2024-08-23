require 'rails_helper'

RSpec.describe 'Discover Page, Discover Index', type: :feature do
  describe 'When a user visits the discover path "/users/:id/discover"' do
    before(:each) do
      @user_1 = User.create!(name: 'Jane Doe', email: 'jane@email.com')

      visit user_discover_movie_path(@user_1)
    end

    it 'They have link to Discover Top Rated Movies' do
      expect(page).to have_button('Discover Top Rated Movies')
      click_button 'Discover Top Rated Movies'
      expect(current_path).to eq(user_movies_path(@user_1))
    end

    it 'They can fill out a text field to enter keyword(s) to search by movie title' do
      expect(page).to have_field(:search)
      expect(page).to have_button('Find Movies')
      fill_in :search, with: 'Deadpool'
      click_button 'Find Movies'
      expect(current_path).to eq(user_movies_path(@user_1))
      # expect(page).to have_content('Deadpool') #Should I test that something is NOT seen? 
    end
  end
end


# require 'rails_helper'

# RSpec.describe 'Discover Page', type: :feature do
#   describe 'As an authenticated user' do
#     before(:each) do
#       @cydnee = User.create!(name: 'Cydnee', email: 'cydnee@example.com')
#     end

#     #% 1. Discover Movies: Search by Title
#     #! When the user clicks on the Top Rated Movies OR the search button, they should be taken to the movies results page
#     VCR.use_cassette('displays_top_movies_and_movie_title_search_functionality.yml') do
#       it 'displays top movies and movie title search functionality', :vcr do
#         visit user_discover_path(@cydnee)
#         within '.discover-top-movies' do
#           expect(page).to have_button('Discover Top Rated Movies')
#         end
#         expect(page).to have_css('.search-movie-title')
#         within '.search-movie-title' do
#           expect(page).to have_field('search')
#           expect(page).to have_button('Search by Movie Title')
#           click_button('Search by Movie Title')
#         end
#         expect(current_path).to eq(user_movies_path(@cydnee))
#       end
#     end

#     #% 2a. Movie Results Page: Top Rated Movies
#     #! There should only be a maximum of 20 results. The above details should be listed for each movie.
#     VCR.use_cassette('shows_the_movie_results_from_top_rated_button.yml') do
#       it 'shows the movie results from top rated button', :vcr do
#         visit user_discover_path(@cydnee)
#         within '.discover-top-movies' do
#           click_button 'Discover Top Rated Movies'
#         end
#         expect(current_path).to eq(user_movies_path(@cydnee))
#         within '.search-results' do
#           within '#movie-129' do
#             expect(page).to have_content('Title: Spirited Away')
#             expect(page).to have_link('Spirited Away')
#             expect(page).to have_content('Vote Average: 8.537')
#           end
#         end
#         expect(page).to have_button('Return to Discover Page')
#       end
#     end

#     #% 2b. Movie Results Page: Search Movies
#     #! There should only be a maximum of 20 results. The above details should be listed for each movie.
#     VCR.use_cassette('returns_the_movies_that_match_from_a_search.yml') do
#       it 'returns the movies that match from a search', :vcr do
#         visit user_discover_path(@cydnee)
#         within '.search-movie-title' do
#           fill_in :search, with: 'Mis'
#           click_on 'Search by Movie Title'
#         end
#         expect(current_path).to eq(user_movies_path(@cydnee))
        
#         within '.search-results' do
#           within '#movie-267970' do
#             expect(page).to have_content('Title: Miss Hokusai')
#             expect(page).to have_link('Miss Hokusai')
#             expect(page).to have_content('Vote Average: 6.7')
#           end
#         end
#         expect(page).to have_button('Return to Discover Page')
#       end
#     end
#   end
# end