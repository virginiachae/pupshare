class SittersController < ApplicationController

  before_action :authenticate_sitter!

  def show
    @sitter = current_sitter
  end

  def create
   @sitter = Sitter.create(sitter_params)
 end

 private

 def sitter_params
   params.require(:sitter).permit(:avatar)
 end
end
