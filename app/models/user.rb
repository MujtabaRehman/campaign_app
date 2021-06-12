class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  
  validates :name , presence: true , length: {minimum:2 } , format: { with: /[a-zA-Z]/} 
  validates :type , presence: true , inclusion:["Expert" , "Novice"]
 
  has_many :comments , as: :commented
 
  before_validation :set_status
  enum status:[:qualified , :unqualified , :banned ]

  def is_novice?
    type="Novice"
  end
  
  def set_status
    self.type=="Expert"? self.status ||=:qualified : self.status ||= :unqualified
  end
  
end