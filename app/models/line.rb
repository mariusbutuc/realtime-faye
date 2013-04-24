# == Schema Information
#
# Table name: lines
#
#  id           :integer          not null, primary key
#  content      :string(255)
#  character_id :integer
#  scene_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Line < ActiveRecord::Base
  belongs_to :character
  belongs_to :scene

  attr_accessible :content
end
