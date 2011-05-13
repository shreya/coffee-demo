class Section < ActiveRecord::Base

  belongs_to :post

  validates :heading, :presence => true
  validates :body, :presence => true
  
end
