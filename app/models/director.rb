class Director < ApplicationRecord
  # dob:date name:string bio:text
  validates :name, presence: true
  validates :dob, presence: true
  validates :bio, presence: true 

  # has_many(:filmography, { :class_name => "Movie", :foreign_key => "director_id", :dependent => :destroy})
end
