class AddCampaignIdToTags < ActiveRecord::Migration[6.1]
  def change
    add_column :tags, :campaign_id, :integer
    add_index :tags, :campaign_id
  end
end
