require 'rails_helper'

describe 'user can edit a link' do
  it 'lets user edit a link if everything is good' do
    User.create(email: "a@a.com", password: "123", password_confirmation: "123")
    visit root_path
    fill_in "Email", with: 'a@a.com'
    fill_in "Password", with: '123'
    click_on 'Login'

    fill_in "URL", with: 'https://www.google.com/'
    fill_in "Title", with: 'Google'
    click_on "Submit"
    click_on "Edit"
    expect(current_path).to eq(edit_link_path(Link.last.id))

    fill_in "URL", with: 'https://news.google.com/news/?ned=us&hl=en'
    fill_in "Title", with: 'Google News'
    click_on "Submit"

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Link updated successfully')

    within('.links') do
      expect(page).to_not have_content("URL: https://www.google.com/")

      expect(page).to have_content("URL: https://news.google.com/news/?ned=us&hl=en")
      expect(page).to have_content('Title: Google News')
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
    fill_in "Title", with: 'Google'
    click_on "Submit"

    click_on "Edit"
    expect(current_path).to eq(edit_link_path(Link.last.id))

    fill_in "URL", with: 'https://news.google.com/news/?ned=us&hl=en'
    fill_in "Title", with: ''
    click_on "Submit"

    # fix flash messages
    # expect(page).to have_content('Link title missing')
    expect(page).to have_content('Link not updated')
    expect(current_path).to eq(edit_link_path(Link.last.id))
  end

  it 'does not allow creation with invalid url' do
    User.create(email: "a@a.com", password: "123", password_confirmation: "123")
    visit root_path
    fill_in "Email", with: 'a@a.com'
    fill_in "Password", with: '123'
    click_on 'Login'

    fill_in "URL", with: 'https://www.google.com/'
    fill_in "Title", with: 'Google'
    click_on "Submit"

    click_on "Edit"
    expect(current_path).to eq(edit_link_path(Link.last.id))

    fill_in "URL", with: 'apple'
    fill_in "Title", with: 'Google Docs'
    click_on "Submit"

    # fix flash messages
    # expect(page).to have_content('Invalid URL')
    expect(page).to have_content('Link not updated')
    expect(current_path).to eq(edit_link_path(Link.last.id))
  end
end
