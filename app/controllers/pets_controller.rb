class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end


  def index_specific
    @pets = Pet.all
    @current_shelter = Shelter.find(params[:shelter_id])
    @current_shelter_id = params[:shelter_id]
  end

  def show
    @pets = Pet.all
    @pet_id = params[:pet_id]
  end

  def new
    @pets = Pet.all
    @current_shelter = Shelter.find(params[:shelter_id])
    @current_shelter_id = params[:shelter_id]
  end

  def create
    shelter_id = params[:shelter_id]
    pet = Pet.create!(pet_params)
    redirect_to "/shelters/#{shelter_id}/pets"
  end

  private

  def pet_params
    params.permit(:image, :name, :approximate_age, :sex, :status, :shelter_id)
  end
end
