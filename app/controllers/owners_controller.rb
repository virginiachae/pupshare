class OwnersController < ApplicationController

  before_action :authenticate_owner!

  def show
    @owner = current_owner
    @rental = Rental.all
  end

  def create
   @owner = Owner.create(owner_params)
   if @owner.save
     OwnerMailer.welcome_email(@owner).deliver
   end
 end


 private

 def owner_params
   params.require(:owner).permit(:avatar)
 end

end
