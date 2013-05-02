class SessionsController < ApplicationController
  def new
    if scene_id = params[:scene_id] # join
      @scene = Scene.find scene_id
      # continue scene
      redirect_to scene_path @scene if session[:username]
    end
  end

  # TODO: Refactor to split in
  #  - Session#create and
  #  - Session#join
  def create
    nickname = params[:username].upcase
    session[:username] = nickname
    scene_id = params[:scene_id]

    unless scene_id
      # Create new character & scene
      random_scene_starter = Starter.find Starter.pluck(:id).sample
      scene = Scene.new
      scene.starter = random_scene_starter
      scene.characters.build nickname: nickname
    else
      # Join existing scene
      scene = Scene.find scene_id
      scene.characters.build nickname: nickname
    end

    if scene.save!
      # Let the first character know we joined, by refreshing his waiting page.
      # This will in turn send him directly to start Writing the Scene.
      PrivatePub.publish_to "/scenes/#{scene_id}/waiting", { marius_says: 'refresh' } if scene_id
      redirect_to scene_path scene
    else
      # TODO: add error message
      redirect_to start_path
    end
  end

  def destroy
    session.delete(:username)
    if scene_id = params[:id]
      PrivatePub.publish_to "/scenes/#{scene_id}", { marius_says: 'quitter' }
    end
    redirect_to root_url, notice: 'You have successfully logged out'
  end

end
