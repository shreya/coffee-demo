class Post < ActiveRecord::Base
  
  validates :title, :presence => true
  validates :body, :presence => true
  
  has_many :sections, :dependent => :destroy
  accepts_nested_attributes_for :sections, :reject_if => :all_blank
  
  def build_section_and_snippet
     sections.build if sections.empty?
     sections.each do |section|
       section.build_snippet if section.snippet.nil?
       section.resources.build if section.resources.empty?
     end
   end

  def post(position)
    increment = position == :previous ? -1 : 1
    Post.find_by_id(id + increment)
  end
  
end
