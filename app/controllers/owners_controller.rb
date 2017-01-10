class OwnersController < ApplicationController

before_action :authenticate_owner!, :only => [:edit, :update, :destroy]

  def show
    @owner = Owner.find_by_id(params[:id])
    @rental = Rental.all
  end

  def create
   @owner = Owner.create(owner_params)
   if @owner.save
     OwnerMailer.welcome_email(@owner).deliver_now
   end
 end


 private

 def owner_params
   params.require(:owner).permit(:avatar)
 end

end
