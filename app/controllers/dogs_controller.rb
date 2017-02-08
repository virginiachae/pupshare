class DogsController < ApplicationController

before_action :authenticate_owner!, :only => [:edit, :update, :destroy, :new]

  def index
    @dogs = Dog.all
    @hash = Gmaps4rails.build_markers(@dogs) do |dog, marker|
      marker.lat dog.latitude
      marker.lng dog.longitude
      marker.infowindow dog.description
      marker.json({image: dog.image(:thumb)})

    end
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.owner = current_owner
    @owner = current_owner

     if @dog.save
       OwnerMailer.new_dog(@owner).deliver_now
       flash[:notice] = "You have successfully created a dog."
       redirect_to owner_path(current_owner)
     end
  end

  def new
    @dog = Dog.new
  end

  def edit
    @dog = Dog.find_by_id(params[:id])
    @owner = current_owner
  end

  def show
    @dog = Dog.find_by_id(params[:id])
  end

  def update
    owner = current_owner
    dog_id = params[:id]
    dog = Dog.find_by(id: dog_id)
    if dog.update(dog_params)
      flash[:notice] = "You have successfully updated your dog."
      redirect_to owner_path(owner)
    else
      redirect_to edit_owner_dog_path(owner, dog)
    end
  end

  def destroy
    @dog = Dog.find_by_id(params[:id])
    if @dog.destroy
      flash[:notice] = "You have successfully deleted your dog."
      redirect_to owner_path(current_owner)
    end
  end

  private
  def dog_params
    params.require(:dog).permit(:name, :description, :image, :address, :longitude, :latitude, :date_start, :date_end)
  end
end
