require "rails_helper"

RSpec.xdescribe "can mark links as unread", :js => :true do
  scenario "Mark a link as unread" do
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

    expect(page).to_not have_link("Mark as Read")

    click_on "Mark as Unread"

    within('.links .read-status') do
      expect(page).to have_text("false")
    end

  end
end
