class AddCampaignIdToDiscussionTopics < ActiveRecord::Migration[6.1]
  def change
    add_column :discussion_topics, :campaign_id, :integer
    add_index :discussion_topics, :campaign_id
  end
end
