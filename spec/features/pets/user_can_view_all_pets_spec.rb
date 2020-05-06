require './spec/rails_helper'

RSpec.describe "pets index page", type: :feature do

  it "user can see each pet and information on the pets index page" do
    shelter = Shelter.create(name: "Angels With Paws")
    pet = Pet.create(image_path: "https://cdn.pixabay.com/photo/2015/06/08/15/02/pug-801826_1280.jpg", name: "Bruno", approximate_age: "4", sex: "M", shelter_id: shelter.id)
    visit "/pets"
    
    expect(page).to have_content(pet.name)
    expect(page).to have_content(pet.approximate_age)
    expect(page).to have_content(pet.sex)
    expect(page).to have_content(pet.shelter.name)
  end
end
