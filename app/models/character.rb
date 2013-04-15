# == Schema Information
#
# Table name: characters
#
#  id         :integer          not null, primary key
#  nickname   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Character < ActiveRecord::Base
  # TODO: add GUID
  # belongs_to  :user
  belongs_to  :scene
  has_many    :lines

  attr_accessible :nickname
end
