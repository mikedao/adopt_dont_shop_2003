require './spec/rails_helper'

RSpec.describe "pet show page", type: :feature do

  it "user can see information for one pet" do
    shelter = Shelter.create(name: "Angels With Paws")
    pet = Pet.create(image_path: "https://cdn.pixabay.com/photo/2015/06/08/15/02/pug-801826_1280.jpg",
                      name: "Bruno",
                      description: "Best dog ever.",
                      approximate_age: "4",
                      sex: "M",
                      shelter_id: shelter.id,
                      adoption_status: "Adoptable")
    visit "/pets/#{pet.id}"
    expect(page).to have_content(pet.name)
    expect(page).to have_content(pet.description)
    expect(page).to have_content(pet.approximate_age)
    expect(page).to have_content(pet.sex)
    expect(page).to have_content(pet.adoption_status)
  end
end
