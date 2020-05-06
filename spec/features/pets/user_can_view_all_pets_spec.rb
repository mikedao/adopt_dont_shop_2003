require './spec/rails_helper'

RSpec.describe "pets index page", type: :feature do

  it "user can see each pet and information on the pets index page" do
    shelter = Shelter.create(name: "Angels With Paws")
    pet = Pet.create(image_path: "https://imgur.com/t/dog/dMapjoS", name: "Bruno", approximate_age: "4", sex: "M", shelter_id: shelter.id)
    visit "/pets"
    expect(page).to have_content(pet.image_path)
    expect(page).to have_content(pet.name)
    expect(page).to have_content(pet.approximate_age)
    expect(page).to have_content(pet.sex)
    expect(page).to have_content(pet.shelter.name)
  end
end
