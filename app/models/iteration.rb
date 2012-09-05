class Iteration < ActiveRecord::Base
  belongs_to :project
  has_many :story
  attr_accessible :description, :end_date, :name, :start_date,:status, :iterationtype
  validates :name, :uniqueness => true, :presence => {:message => "This name is already in use "} 
  #validates :name, :uniqueness => {:case_sensitive => false}

end
