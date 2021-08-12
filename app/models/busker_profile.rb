class BuskerProfile < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  has_many :reviews

  def self.search(query, option)
    if query 
      self.where("LOWER(#{option}) LIKE ?", "%#{query.downcase}%")
    else
      self.all
    end

  end


  #data_sanitization
  before_save :remove_whitespace

  private
  def remove_whitespace
    self.title = self.title.strip 
    self.description = self.description.strip
  end
  
end
