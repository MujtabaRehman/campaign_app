class Comment < ApplicationRecord

 validates :title , presence: true , length: {minimum:2 } , format: { with: /[a-zA-Z]/}

  belongs_to :user, class_name: "user", foreign_key: "user_id"
 
 belongs_to :commentable, polymorphic: true
 belongs_to :commented, polymorphic: true
end
