require "rails_helper"

RSpec.describe "can filter", :js => :true do
  scenario "filter by letter" do
    user = User.create(email: "a@a.com", password: "123", password_confirmation: "123")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    Link.create(url:"https://turing.io", title:"Turing", user_id: 1)
    Link.create(url:"https://www.google.com", title:"Google", user_id: 1)
    visit "/"

    expect(page).to have_selector('div.link', count: 2)

    fill_in 'filter-input', with: 'goo'

    expect(page).to have_selector('div.link', count: 1)
  end
end
