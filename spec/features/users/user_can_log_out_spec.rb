require 'rails_helper'

describe 'user can log out' do
  it 'lets a user log out' do
    user = User.create(email: "a@a.com", password: "123", password_confirmation: "123")

    visit root_path
    fill_in "Email", with: 'a@a.com'
    fill_in "Password", with: '123'
    click_on 'Login'

    click_on('Sign Out')

    expect(current_path).to eq(login_path)
  end
end
