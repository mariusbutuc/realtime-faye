# == Schema Information
#
# Table name: scenes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Scene < ActiveRecord::Base
  has_many  :lines
  has_many  :characters
  has_one   :starter
end
