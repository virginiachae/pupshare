class DogsController < ApplicationController
  def index
    @dogs = Dog.all
    @hash = Gmaps4rails.build_markers(@dogs) do |dog, marker|
      marker.lat dog.latitude
      marker.lng dog.longitude
      marker.infowindow dog.description
      marker.picture({
       "url" => "http://people.mozilla.com/~faaborg/files/shiretoko/firefoxIcon/firefox-32.png",
       "width" =>  32,
       "height" => 32})
       marker.json({name: dog.name})
    end
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.owner = current_owner
     if @dog.save
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
      redirect_to owner_path(owner)
    else
      redirect_to edit_owner_dog_path(owner, dog)
    end
  end

  def destroy
    @dog = Dog.find_by_id(params[:id])
    @dog.destroy
    redirect_to owner_path(current_owner)
  end

  private
  def dog_params
    params.require(:dog).permit(:name, :description, :image)
end
end
