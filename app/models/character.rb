class Character < ActiveRecord::Base
  # belongs_to  :user
  belongs_to  :scene
  has_many    :lines

  attr_accessible :nickname
end
