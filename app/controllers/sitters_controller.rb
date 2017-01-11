class SittersController < ApplicationController

  before_action :authenticate_sitter!, :only => [:edit, :update, :destroy]

  def show
    @sitter = Sitter.find_by_id(params[:id])
  end


  def create
   @sitter = Sitter.create(sitter_params)
 end

 private

 def sitter_params
   params.require(:sitter).permit(:avatar)
 end
end
