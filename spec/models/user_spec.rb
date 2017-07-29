require 'rails_helper'

RSpec.describe User, type: :model do
  it "attributes" do
    user = User.create(email: "a@a.com", password: "123", password_confirmation: "123")
    expect(user).to respond_to(:email)
    expect(user).to respond_to(:password_confirmation)
  end

  it "relationships" do
    user = User.create(email: "a@a.com", password: "123", password_confirmation: "123")
    expect(user).to respond_to(:links)
  end


end
