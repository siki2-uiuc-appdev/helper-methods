class Director < ApplicationRecord
  # dob:date name:string bio:text
  validates :name, presence: true
  validates :dob, presence: true
  validates :bio, presence: true 

  
end
