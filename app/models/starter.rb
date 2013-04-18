# == Schema Information
#
# Table name: starters
#
#  id         :integer          not null, primary key
#  content    :text
#  title      :string(255)
#  scene_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Starter < ActiveRecord::Base
  belongs_to  :scene

  attr_accessible :title, :content
end
