class BuskerProfile < ApplicationRecord
  belongs_to :user
  has_one_attached :picture

  def self.search(query, option)
    if query 
      self.where("LOWER(#{option}) LIKE ?", "%#{query.downcase}%")
    else
      self.all
    end

  end
end
