class SessionsController < ApplicationController
  def new
  end

  def create
    session[:username] = params[:username]
    first_character = Character.create nickname: params[:username]
    scene_starter = Starter.find Starter.pluck(:id).sample

    scene = Scene.new
    scene.starter = scene_starter
    scene.characters << first_character
    scene.save!

    redirect_to scene_path scene
  end
end
