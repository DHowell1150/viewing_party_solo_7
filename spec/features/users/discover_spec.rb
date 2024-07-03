require 'rails_helper'

RSpec.describe 'users discover movies page', type: :feature do
  describe 'Happy Paths' do
    before(:each) do
      @user = User.create!(name: 'Tommy', email: 'tommy@email.com')

      # When I visit the '/users/:id/discover' path (where :id is the id of a valid user),
      visit user_discover_movie_path(@user)
    end

    it 'US 1 Has a "Discover Top Rated Movies" "Search by Movie Title" button' do
      expect(page).to have_button("Discover Top Rated Movies")
      expect(page).to have_field(:movie_title)
      expect(page).to have_button("Search by Movie Title")
    end

    # it 'US 2: has a "Search by Movie Title" button that redirects to "user_movies_path(@user, @movie)"' do
    #   @movie = Movie.create!(title: 'Top Gun', 
    #                         ave_vote: 4.5, 
    #                         runtime: 135,
    #                         genre: "Action",
    #                         description: "xyz",
    #                         first_10_cast_members: { 
    #                                                 "character1": "Thesbian", 
    #                                                 "character2": "Thesbian", 
    #                                                 "character3": "Thesbian", 
    #                                                 "character4": "Thesbian", 
    #                                                 "character5": "Thesbian", 
    #                                                 "character6": "Thesbian", 
    #                                                 "character7": "Thesbian", 
    #                                                 "character8": "Thesbian", 
    #                                                 "character9": "Thesbian", 
    #                                                 "character10": "Thesbian", 
    #                                               },
    #                         review_count: 1234,
    #                         review_data: {"Author Name": "Best movie all year"})
    #   # - a text field to enter keyword(s) to search by movie title
    #   # - a Button to Search by Movie Title


    #   # - fill out the movie title search and click the Search button
    #   fill_in 'Movie Title Keyword', with: @movie.title
    #   expect(current_path).to eq(user_movies_path(@user, @movie))
    # end

  # describe "sad paths" do
  #   it 'when they fill in form with missing information' do
  #     fill_in "user[name]", with: ""
  #     fill_in "user[email]", with: ""
  #     click_button 'Create New User'

  #     expect(current_path).to eq(register_user_path)
  #     expect(page).to have_content("Name can't be blank, Email can't be blank")
  #   end

  #   it 'They fill in form with invalid email format (only somethng@something.something)' do 
  #     fill_in "user[name]", with: "Sam"
  #     fill_in "user[email]", with: "sam sam@email.co.uk"

  #     click_button 'Create New User'

  #     expect(current_path).to eq(register_user_path)
  #     expect(page).to have_content('Email is invalid')

  #     fill_in "user[name]", with: "Sammy"
  #     fill_in "user[email]", with: "sam@email..com"
  #     click_button 'Create New User'

  #     expect(current_path).to eq(register_user_path)
  #     expect(page).to have_content('Email is invalid')

  #     fill_in "user[name]", with: "Sammy"
  #     fill_in "user[email]", with: "sam@emailcom."
  #     click_button 'Create New User'

  #     expect(current_path).to eq(register_user_path)
  #     expect(page).to have_content('Email is invalid')

  #     fill_in "user[name]", with: "Sammy"
  #     fill_in "user[email]", with: "sam@emailcom@"
  #     click_button 'Create New User'

  #     expect(current_path).to eq(register_user_path)
  #     expect(page).to have_content('Email is invalid')
  #   end
  end
end
