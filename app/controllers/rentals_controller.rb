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
    @rental.done_renting = false
     @owner = @rental.dog.owner
     @sitter = @rental.sitter
    p @rental.dog.owner.first
    @rental.save
      if @rental.save
        OwnerMailer.pending_rental(@owner).deliver_now
      end

  end

  def edit
  end

  def show
    @rental = Rental.find_by_id(params[:id])
  end

  def update
    @rental = Rental.find_by_id(params[:id])
    @rental.update_attributes(done_renting: true)
  end

  def approve
    @rental = Rental.find_by_id(params[:id])
    @rental.update_attributes(approved: true, pending: false)
  end

  def destroy
    @rental = Rental.find_by_id(params[:id])
    @rental.destroy
  end
end
