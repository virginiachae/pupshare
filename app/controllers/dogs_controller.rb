class DogsController < ApplicationController
  def index
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
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
  def dog_params
    params.require(:dog).permit(:name, :description)
end
end
