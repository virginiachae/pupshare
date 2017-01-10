class OwnersController < ApplicationController

  before_action :authenticate_owner!

  def show
    @owner = current_owner
  end

  def create
   @owner = Owner.create(owner_params)
 end


 private

 def owner_params
   params.require(:owner).permit(:avatar)
 end

end
