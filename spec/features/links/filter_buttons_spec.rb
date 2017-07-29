require "rails_helper"

RSpec.describe "can filter with buttons", :js => :true do
  scenario "filter by read" do
    user = User.create(email: "a@a.com", password: "123", password_confirmation: "123")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    Link.create(url:"https://turing.io", title:"Turing", user_id: 1, read: false)
    Link.create(url:"https://www.google.com", title:"Google", user_id: 1, read: true)
    Link.create(url:"https://www.google.com", title:"Google", user_id: 1, read: true)

    visit "/"

    expect(page).to have_selector('div.link', count: 3)

    click_on "Show Read"

    expect(page).to have_selector('div.link', count: 2)
  end

  scenario "filter by unread" do
    user = User.create(email: "a@a.com", password: "123", password_confirmation: "123")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    Link.create(url:"https://turing.io", title:"Turing", user_id: 1, read: false)
    Link.create(url:"https://www.google.com", title:"Google", user_id: 1, read: true)
    Link.create(url:"https://www.google.com", title:"Google", user_id: 1, read: true)

    visit "/"

    expect(page).to have_selector('div.link', count: 3)

    click_on "Show Unread"

    expect(page).to have_selector('div.link', count: 1)
  end
end
