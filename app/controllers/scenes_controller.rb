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
    unless session[:username]
      redirect_to start_path
      return
    end
    @scene            = Scene.find params[:id]
    unless @scene.characters.count == 2
      redirect_to waiting_path
      return
    end
    starter           = @scene.starter
    first_character   = @scene.characters.first.nickname
    second_character  = @scene.characters.last.nickname

    @title    = starter.title.html_safe
    @content  = starter.content
                .gsub('{{X}}', first_character)
                .gsub('{{Y}}', second_character)
                .html_safe
  end

  def waiting
    @scene_id = params[:id]
    scene = Scene.find @scene_id

    if scene.characters.count == 2
      redirect_to scene_path
    else
      @join_url   = join_url  scene
      @start_url  = scene_url scene
    end
  end

  def drop_a_line
    channel = "/scenes/#{params[:id]}"
    message = { from: character, msg: line }

    PrivatePub.publish_to channel, message
  end
end
