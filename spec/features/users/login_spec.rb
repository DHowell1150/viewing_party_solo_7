require 'rails_helper'

RSpec.describe 'User Login', type: :feature do
  it 'can log in with valid credentials' do
    @user = User.create!(name: 'Tommy', email: 'tommy@email.com', password: "test123")
    visit root_path

    click_on "I already have an account"

    expect(current_path).to eq(login_path)

    fill_in :name, with: 'Tommy'
    fill_in :email, with: 'tommy@email.com'
    fill_in :password, with: 'test123'

    click_button 'Log In'

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome, Tommy!")
  end

  it 'can not log in with bad credentials' do
    @user = User.create!(name: 'Tommy', email: 'tommy@email.com', password: "test123")
    visit login_path

    fill_in :name, with: 'Tommy' #test fails if I enter wrong name or email
    fill_in :email, with: 'tommy@email.com'
    fill_in :password, with: 'tes'

    click_button 'Log In'

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Sorry, your credentials are bad")
  end
end
