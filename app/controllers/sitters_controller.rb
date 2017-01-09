class SittersController < ApplicationController

  before_action :authenticate_sitter!

  def show
    @sitter = current_sitter
  end
end
