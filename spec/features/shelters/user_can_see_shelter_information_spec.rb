require './spec/rails_helper'

RSpec.describe "shelter show page", type: :feature do
  it "user can see the name, address, city, state and zip of the shelter" do
    shelter1 = Shelter.create(name: "Angels With Paws", address: "2540 Youngfield St", city: "Lakewood", state: "CO", zip: "80215")
    #shelter2 = Shelter.create(name: "MaxFund Dog Shelter", address: "1005 Galapago", city: "Denver", state: "CO", zip: "80204")
    visit "/shelter/:id"
    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter1.address)
    expect(page).to have_content(shelter1.city)
    expect(page).to have_content(shelter1.state)
    expect(page).to have_content(shelter1.zip)
  end
end
