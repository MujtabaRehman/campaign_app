class DiscussionTopic < ApplicationRecord
  
  validates :title , presence: true , length: {minimum:3 } , format: { with: /[a-zA-Z]/}
  has_many :comments, as: :commentable

  belongs_to :campaign, foreign_key: "campaign_id"
  belongs_to :topic_creator , polymorphic: true

end

