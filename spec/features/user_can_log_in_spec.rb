require 'rails_helper'

describe 'user can log in' do
  it 'lets a user log in with good creds' do
    User.create(email: "a@a.com", password: "123", password_confirmation: "123")

    visit root_path

    expect(current_path).to eq(login_path)

    fill_in "Email", with: 'a@a.com'
    fill_in "Password", with: '123'
    click_on 'Login'

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Login successful")
    expect(page).to have_content("URL")
    expect(page).to have_link("Sign Out")
  end

  it 'doees not let log in with bad creds' do
    User.create(email: "a@a.com", password: "123", password_confirmation: "123")

    visit root_path

    expect(current_path).to eq(login_path)

    fill_in "Email", with: 'a@a.com'
    fill_in "Password", with: '123456'
    click_on 'Login'

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Login failed")
  end
end
