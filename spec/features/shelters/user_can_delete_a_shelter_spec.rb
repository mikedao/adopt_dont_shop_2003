require './spec/rails_helper'

RSpec.describe "shelter delete", type: :feature do

  before(:all) do
    @shelter1 = Shelter.create(name: "Angels With Paws", address: "2540 Youngfield St", city: "Lakewood", state: "CO", zip: "80215")
    @shelter2 = Shelter.create(name: "MaxFund Dog Shelter", address: "1005 Galapago", city: "Denver", state: "CO", zip: "80204")
  end

  it "deletes the shelter when user clicks delete" do
    visit "/shelters/#{@shelter1.id}"
    click_on "Delete Shelter"

    expect(current_path).to eq("/shelters")
  end

end
