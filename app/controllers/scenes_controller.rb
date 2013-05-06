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
    @line_kinds = Options['line_kind'].map{ |kind| [kind.capitalize, kind] }
  end

  def waiting
    scene_id = params[:id]
    @scene = Scene.find scene_id

    if @scene.characters.count == 2
      redirect_to scene_path
    else
      @join_url   = join_url  @scene
      @start_url  = scene_url @scene
    end
  end

  def drop_a_line
    scene         = Scene.find params[:id]
    nickname      = session[:username]
    character     = Character.find_by_nickname nickname
    line_content  = params[:line_content]
    line_kind     = params[:line_kind]

    line = Line.new content: line_content, kind: line_kind
    line.character  = character
    line.scene      = scene
    if line.save!
      channel = "/scenes/#{params[:id]}"
      message = { from: nickname, msg: line_content, kind: line_kind }

      PrivatePub.publish_to channel, message
    end
  end

  def leave
    PrivatePub.publish_to("/scenes/#{params[:id]}", { marius_says: 'quitter', username: session[:username] }) if params[:id]
    render nothing: true
  end
end
