require 'rails_helper'

describe 'visitor can sign up' do
  it 'redirects a visitor to sign up or login page' do
    visit root_path

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Login")
    expect(page).to have_link("Sign up here")

    click_on("Sign up here")

    expect(current_path).to eq(new_user_path)
  end

  xit 'lets a visitor sign up with correct details' do
    visit root_path

    click_on("Sign up here")

    expect(current_path).to eq(new_user_path)

    fill_in "Email", with: 'ah@ah.com'
    fill_in 'Password', with: 'puppies'
    fill_in 'Password Confirmation', with: puppies
    click_on("Submit")

    expect(current_path).to eq(root_path)
    expect(page).to have_content("URL:")
    expect(page).to have_link("Sign Out")
  end

  xit 'does not let a visitor sign up with no email' do
    visit root_path

    click_on("Sign up here")

    expect(current_path).to eq(new_user_path)

    fill_in 'Password', with: 'puppies'
    fill_in 'Password Confirmation', with: puppies
    click_on("Submit")

    expect(page).to have_content("Email can't be blank, try again")
    expect(current_path).to eq(new_user_path)
  end

  xit 'does not let a visitor sign up with no password' do
    visit root_path

    click_on("Sign up here")

    expect(current_path).to eq(new_user_path)

    fill_in "Email", with: 'ah@ah.com'
    fill_in 'Password Confirmation', with: "puppies"
    click_on('Submit')

    expect(page).to have_content('Password cannot be blank, try again')
    expect(page).to have_content('Password confirmation does not match, try again')
    expect(current_path).to eq(new_user_path)
  end

  xit 'does not let a visitor sign up with non matching password confirmation' do
    visit root_path

    click_on("Sign up here")

    expect(current_path).to eq(new_user_path)

    fill_in "Email", with: 'ah@ah.com'
    fill_in 'Password', with: 'puppies'
    fill_in 'Password Confirmation', with: 'apples'
    click_on('Submit')

    expect(page).to have_content('Password confirmation does not match, try again')
    expect(current_path).to eq(new_user_path)
  end

  xit 'does not let a visitor sign up with no password confirmation' do
    visit root_path

    click_on("Sign up here")

    expect(current_path).to eq(new_user_path)

    fill_in "Email", with: 'ah@ah.com'
    fill_in 'Password', with: 'puppies'
    click_on('Submit')

    expect(page).to have_content('Password confirmation cannot be blank, try again')
    expect(current_path).to eq(new_user_path)
  end
end
