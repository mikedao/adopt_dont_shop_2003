require './spec/rails_helper'

RSpec.describe "user can create a pet", type: :feature do

  before :each do
    @shelter = Shelter.create(name: "Angels With Paws")
  end

  it "user goes to new pet page when clicking button" do
    # pet = Pet.create(image_path: "https://cdn.pixabay.com/photo/2015/06/08/15/02/pug-801826_1280.jpg",
    #                   name: "Bruno",
    #                   approximate_age: "4",
    #                   sex: "M",
    #                   shelter_id: shelter.id,
    #                   adoption_status: "Adoptable"
    #                 )
    visit("shelter/#{@shelter.id}/pets")
    click_button("Create New Pet")
    expect(current_path).to eq("shelter#{@shelter.id}/pets/new")
  end

  it "user can create a pet" do
    visit("shelter#{@shelter.id}/pets/new")

    fill_in "name", with: "Koa"
    fill_in "approximate_age", with: "4"
    fill_in "sex", with: "M"
    fill_in "adoption_status", with: "Adoptable"
    fill_in "image_path", with: "https://cdn.pixabay.com/photo/2015/06/08/15/02/pug-801826_1280.jpg"
    click_button "Create Pet"

    expect(current_path).to eq("shelter#{@shelter.id}/pets")
    expect(page).to have_content("Koa")
    expect(page).to have_content("4")
    expect(page).to have_content("M")
    expect(page).to have_content("Adoptable")
  end

end
