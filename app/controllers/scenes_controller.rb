class ScenesController < ApplicationController
  def index
    unless session[:username]
      redirect_to start_path
      return
    end

    character = Character.find_by_nickname session[:username]
    if character
      @scene = character.scene
      @title = @scene.starter.title
    else
      session.delete(:username)
      redirect_to start_path
      return
    end
  end

  def show
    redirect_to start_path unless session[:username]
    @scene            = Scene.find params[:id]
    starter           = @scene.starter
    first_character   = @scene.characters.first.nickname
    second_character  = @scene.characters.last.nickname

    @title    = starter.title.html_safe
    @content  = starter.content
                .gsub('{{X}}', first_character)
                .gsub('{{Y}}', second_character)
                .html_safe
  end

  def drop_a_line
    @channel = "/scenes/#{params[:id]}"
    @message = { from: session[:username], msg: params[:line] }

    PrivatePub.publish_to @channel, @message
  end
end
