class Line < ActiveRecord::Base
  belongs_to :character
  belongs_to :scene

  attr_accessible :content
end
