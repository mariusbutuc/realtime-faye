class SessionsController < ApplicationController
  def new
  end

  def create
    session[:username] = params[:username]
    random_scene_starter = Starter.find Starter.pluck(:id).sample

    scene = Scene.new
    scene.starter = random_scene_starter
    scene.characters.build nickname: params[:username]
    # binding.pry
    scene.save!

    redirect_to scene_path scene
  end
end
