class PetsController < ApplicationController

  def index
    @pets = Pet.all.order_by_adoption_status
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    @pet = Pet.create({
      name: params[:name],
      approximate_age: params[:approximate_age],
      sex: params[:sex],
      image_path: params[:image_path],
      description: params[:description],
      adoption_status: "Adoptable",
      shelter_id: params[:shelter_id]
      })
    redirect_to "/shelters/#{@pet.shelter_id}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update({
      name: params[:name],
      approximate_age: params[:approximate_age],
      sex: params[:sex],
      image_path: params[:image_path],
      description: params[:description],
      })
    pet.save
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to "/pets"
  end
end
