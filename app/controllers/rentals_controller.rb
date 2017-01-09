class RentalsController < ApplicationController
  def index
  end

  def create
  end

  def new
    @rental = Rental.new
    @rental.sitter = current_sitter
    @rental.dog = @dog
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
