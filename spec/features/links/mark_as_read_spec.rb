require "rails_helper"

RSpec.describe "can mark links as read", :js => :true do
  scenario "Mark a link as read" do
    user = User.create(email: "a@a.com", password: "123", password_confirmation: "123")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    Link.create(url:"https://turing.io", title:"Turing", user_id: 1)
    visit "/"

    within('.links .read-status') do
      expect(page).to have_text("false")
    end

    click_on "Mark as Read"

    within('.links .read-status') do
      expect(page).to have_text("true")
    end

  end
end
