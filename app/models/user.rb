class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :events

  #data_sanitization
  before_save :enforce_lower_case_username

  private
  def enforce_lower_case_username
    self.username = self.username.downcase
  end
end
