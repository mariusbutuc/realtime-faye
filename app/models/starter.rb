class Starter < ActiveRecord::Base
  belongs_to  :scene

  attr_accessible :content
end
