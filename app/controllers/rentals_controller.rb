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
        flash[:notice] = "Your rental request has been sent to the owner."
        OwnerMailer.pending_rental(@owner).deliver_now
        SitterMailer.scheduled_rental(@sitter).deliver_now
      end
      redirect_to sitter_path(current_sitter)
  end

  def edit
  end

  def show
    @rental = Rental.find_by_id(params[:id])
  end

  def update
    @rental = Rental.find_by_id(params[:id])
    @rental.update_attributes(done_renting: true)
      if @rental.save
        flash[:notice] = "You have successfully ended the Pup Share."
        redirect_to owner_path(current_owner)
      end
    end

  def approve
    @rental = Rental.find_by_id(params[:id])
    @sitter = @rental.sitter
    @owner = current_owner
    @rental.update_attributes(approved: true, pending: false)
    if @rental.save
      flash[:notice] = "You have approved #{@sitter.first}."
      SitterMailer.rental_approved(@sitter, @owner, @rental).deliver_now
      redirect_to owner_path(current_owner)
    end
  end

  def destroy
    @rental = Rental.find_by_id(params[:id])
    @sitter = @rental.sitter
    @rental.destroy
      if @rental.destroy
        flash[:notice] = "Your Pup Share request has been canceled."
        SitterMailer.declined_rental(@sitter, @rental).deliver_now
        redirect_to dogs_path
      end
  end
end
