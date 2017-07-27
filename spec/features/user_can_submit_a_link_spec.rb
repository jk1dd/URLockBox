require 'rails_helper'

describe 'user can submit a link', :js => :true do
  it 'lets user submit a link if everything is good' do
    User.create(email: "a@a.com", password: "123", password_confirmation: "123")
    visit root_path
    fill_in "Email", with: 'a@a.com'
    fill_in "Password", with: '123'
    click_on 'Login'

    fill_in "URL", with: 'https://www.google.com/'
    fill_in "Title", with: 'Google'
    click_on "Submit"

    within('.links') do
      expect(page).to have_content("URL: https://www.google.com/")
      expect(page).to have_content('Title: Google')
      expect(page).to have_content('Read?: false')
    end
  end

  it 'does not allow creation with missing title' do
    User.create(email: "a@a.com", password: "123", password_confirmation: "123")
    visit root_path
    fill_in "Email", with: 'a@a.com'
    fill_in "Password", with: '123'
    click_on 'Login'

    fill_in "URL", with: 'https://www.google.com/'
    click_on "Submit"

    expect(page).to have_content("Title can't be blank")
  end

  it 'does not allow creation with invalid url' do
    User.create(email: "a@a.com", password: "123", password_confirmation: "123")
    visit root_path
    fill_in "Email", with: 'a@a.com'
    fill_in "Password", with: '123'
    click_on 'Login'

    fill_in "URL", with: 'google.co'
    fill_in "Title", with: 'Google'
    click_on "Submit"

    expect(page).to have_content('Url is not a valid')
    expect(current_path).to eq(root_path)
  end
end
