# == Schema Information
#
# Table name: characters
#
#  id         :integer          not null, primary key
#  nickname   :string(255)
#  scene_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Character < ActiveRecord::Base
  # TODO: add GUID
  # belongs_to  :user
  belongs_to  :scene
  has_many    :lines

  attr_accessible :nickname

  # validate :max_two_users_per_scene, on: :create

  # private

  # def max_two_users_per_scene
  #   binding.pry
  #   if self.scene.characters(:reload).count >= 3
  #     errors.add( :base, '2 Write the Scene, 3 is a crouwd' )
  #   end
  # end
end
