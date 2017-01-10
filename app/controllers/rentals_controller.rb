class RentalsController < ApplicationController
  def index
  end

  def create
  end

  def new
    @rental = Rental.new
    @rental.dog = Dog.find_by_id(params[:dog_id])
    @rental.sitter = current_sitter
    @rental.pending = true
    @rental.approved = false
    @rental.save
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
