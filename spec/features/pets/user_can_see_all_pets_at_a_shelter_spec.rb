require './spec/rails_helper'

RSpec.describe "shelter pets index page", type: :feature do

  before :each do
    @shelter = Shelter.create(name: "Angels With Paws")
    @pet1 = Pet.create(
      image_path: "https://cdn.pixabay.com/photo/2015/06/08/15/02/pug-801826_1280.jpg",
      name: "Bruno",
      approximate_age: "4",
      sex: "M",
      shelter_id: @shelter.id)
    @pet2 = Pet.create(
      image_path: "https://cdn.pixabay.com/photo/2015/11/17/13/13/dogue-de-bordeaux-1047521_1280.jpg",
      name: "Woody",
      approximate_age: "2",
      sex: "F",
      shelter_id: @shelter.id)
  end

  it "user can see all pets at a specific shelter" do
    visit "/shelters/#{@shelter.id}/pets"

    expect(page).to have_content(@pet1.name)
    expect(page).to have_content(@pet1.approximate_age)
    expect(page).to have_content(@pet1.sex)
    expect(page).to have_content(@pet2.name)
    expect(page).to have_content(@pet2.approximate_age)
    expect(page).to have_content(@pet2.sex)
    expect(page).to have_content(@shelter.pet_count)
  end

  it "user can go to shelter pets index from shelter index" do
    visit "/shelters/#{@shelter.id}"
    click_link "All Pets at #{@shelter.name}"

    expect(current_path).to eq("/shelters/#{@shelter.id}/pets")
  end

end
