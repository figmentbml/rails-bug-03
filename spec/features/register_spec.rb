require 'rails_helper'
require 'capybara/rails'

feature 'Register' do

  scenario 'Users cannot register w/o email' do
    visit root_path
    click_on "Register"
    fill_in "Name", with: "Betty"
    fill_in "Password", with: "password"
    fill_in "Confirm", with: "password"
    click_button "Register"
    expect(page).to have_no_content("Sign Out")
    expect(page).to have_content("Email can't be blank")
  end

  scenario 'Users can register' do
    visit root_path
    click_on "Register"
    fill_in "Name", with: "Betty"
    fill_in "Email", with: "betty@email.com"
    fill_in "Password", with: "password"
    fill_in "Confirm", with: "password"
    click_button "Register"
    expect(page).to have_content("Logout")
    expect(page).to have_content("betty@email.com")
    expect(page).to have_no_content("Email can't be blank")
  end


end
