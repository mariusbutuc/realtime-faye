# == Schema Information
#
# Table name: lines
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Line < ActiveRecord::Base
  belongs_to :character
  belongs_to :scene

  attr_accessible :content
end
