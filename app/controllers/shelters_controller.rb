class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
  end

  def create
    Shelter.create!(shelter_params)
    redirect_to '/shelters'
  end

  def destroy
    Shelter.destroy(params[:id])
    redirect_to '/shelters'
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update!(shelter_params)
    redirect_to "/shelters/#{shelter.id}"
  end

  def pets
    @shelter = Shelter.find(params[:id])
    if params[:adoption_status] == "true"
      @pets = @shelter.pets.adoptable_only
    elsif params[:adoption_status] == "false"
      @pets = @shelter.pets.pending_only
    else
      @pets = @shelter.pets.order_by_adoption_status
    end
  end

  private

  def shelter_params
    params.permit(
        :name,
        :address,
        :city,
        :state,
        :zip
      )
  end
end
