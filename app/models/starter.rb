# == Schema Information
#
# Table name: starters
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string(255)
#

class Starter < ActiveRecord::Base
  belongs_to  :scene

  attr_accessible :title, :content
end
