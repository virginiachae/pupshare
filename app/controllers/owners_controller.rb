class OwnersController < ApplicationController

  before_action :authenticate_owner!

  def show
    @owner = current_owner
  end
end
