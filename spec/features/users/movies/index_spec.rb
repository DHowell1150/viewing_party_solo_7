require 'rails_helper'

RSpec.describe 'movie index', type: :feature do
  describe 'US2' do
    describe ' as a user when I visit /user_movies_path(user)' do
      before(:each) do
        @user = User.create!(name: Faker::Name.name, email: Faker::Internet.email)
        @movies = MovieFacade.top_rated_movies

        visit user_movies_path(@user)
      end

      it 'displays each movie with its attributes' do
        within(first(".movie")) do
          expect(page).to have_css(".title")
          expect(page).to have_css(".vote_ave")
          expect(page).to have_css(".id")
        end
      end
    end
  end
end
