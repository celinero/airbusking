class Review < ApplicationRecord
  belongs_to :user
  belongs_to :busker_profile

  def self.search(query)
    if query 
      self.where("LOWER(#{name}) LIKE ?", "%#{query.downcase}%")
    else
      self.all
    end
  end


end
