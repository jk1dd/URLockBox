require 'rails_helper'

RSpec.describe Link, type: :model do
  it "attributes" do
    link = Link.create(url:"https://turing.io", title:"Turing", user_id: 1)
    expect(link).to respond_to(:title)
    expect(link).to respond_to(:url)
  end

  it "relationships" do
    link = Link.create(url:"https://turing.io", title:"Turing", user_id: 1)
    expect(link).to respond_to(:user)
  end


end
