class Scene < ActiveRecord::Base
  has_many  :lines
  has_many  :characters
  has_one   :starter
ends
