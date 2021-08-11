class Review < ApplicationRecord
  belongs_to :user
  belongs_to :busker_profile
end
