class SessionsController < ApplicationController
  def new
    @scene_id = params[:id] rescue nil
    redirect_to scene_path @scene_id if session[:username]
  end

  def create
    session[:username] = params[:username]
    scene_id = params[:scene_id]

    unless scene_id
      # create new character & scene
      random_scene_starter = Starter.find Starter.pluck(:id).sample
      scene = Scene.new
      scene.starter = random_scene_starter
      scene.characters.build nickname: params[:username]
    else
      # join existing scene
      scene = Scene.find scene_id
      scene.characters.build nickname: params[:username]
    end

    if scene.save!
      redirect_to scene_path scene
    else
      # TODO: add error message
      redirect_to start_path
    end
  end

end
