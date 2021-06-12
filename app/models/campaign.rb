class Campaign < ApplicationRecord

  enum estimated_time: [:within_one_week , :within_one_month , :within_three_months ]

  validates :title ,presence: true , length: {minimum:3 } , format: { with: /[a-zA-Z]/} 
  validates :purpose ,presence: true , length: {minimum:3 } , format: { with: /[a-zA-Z]/ }
  validates :estimated_time , inclusion: {in: estimated_times.keys}
 
  has_many :tags , dependent: :destroy 
  has_many :do_lists , dependent: :destroy  
  has_many :discussion_topics , dependent: :destroy
  has_many :comments, as: :commentable , dependent: :destroy
  belongs_to :expert, class_name: "User", foreign_key: "user_id"
end
