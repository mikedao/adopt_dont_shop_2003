require './spec/rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all shelter names" do
    shelter1 = Shelter.create(name: "Angels With Paws")
    shelter2 = Shelter.create(name: "MaxFund Dog Shelter")
    visit "/shelters"
    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter2.name)
  end
end
