class ScenesController < ApplicationController
  def show
    @scene = Scene.find params[:id]
    binding.pry
  end
end
