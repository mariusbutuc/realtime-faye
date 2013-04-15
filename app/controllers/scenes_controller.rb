class ScenesController < ApplicationController
  def index
    unless session[:username]
      redirect_to start_path
      return
    end

    character = Character.find_by_nickname session[:username]
    if character
      @scene = character.scene
    else
      session.delete(:username)
      redirect_to start_path
      return
    end

  end

  def show
    redirect_to start_path unless session[:username]
    @scene = Scene.find params[:id]
  end

  def new_line
    @channel = "/scenes/#{params[:id]}"
    @message = { from: session[:username], msg: params[:line] }

    PrivatePub.publish_to @channel, @message
  end
end
