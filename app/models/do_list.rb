class DoList < ApplicationRecord
 validates :title , presence: true , length: {minimum:2 } , format: { with: /[a-zA-Z]/} 
 belongs_to :campaign, class_name: "Campaign", foreign_key: "campaign_id"
end
