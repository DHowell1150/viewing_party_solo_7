require 'rails_helper'

RSpec.describe 'movie show', type: :feature do
  describe ' USER STORY 3' do
    describe 'as a user when I visit user_movie_path(@user, @movie)' do
      before(:each) do
        @user = User.create!(name: Faker::Name.name, email: Faker::Internet.email)
        @movies = MovieFacade.top_rated_movies

        @movie1 = @movies.first
        visit user_movie_path(@user, @movie1)
      end
      it 'displays button to create a party' do
        expect(page).to have_button('Create a Viewing Party')
      end

      it 'displays button to return to discover page' do
        expect(page).to have_button('Return to the Discover Page')
      end

      # it "displays movie information" do
      #   within "#movie-#{@movie1.id}" do
      #     expect(page).to have_content(@movie1.title)
      #     expect(page).to have_content(@movie1.vote_ave)
      #     expect(page).to have_content(@movie1.runtime)
      #     expect(page).to have_content(@movie1.genres)
      #     expect(page).to have_content(@movie1.description)
      #     expect(page).to have_content(@movie1.cast_members)
      #     expect(page).to have_content(@movie1.review_count)
      #     expect(page).to have_content(@movie1.reviewer_author)
      #     expect(page).to have_content(@movie1.reviewer_info)
      #   end
      # end
    end
  end
end
