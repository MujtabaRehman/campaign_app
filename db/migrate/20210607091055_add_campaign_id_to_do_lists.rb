class AddCampaignIdToDoLists < ActiveRecord::Migration[6.1]
  def change
    add_column :do_lists, :campaign_id, :integer
    add_index :do_lists, :campaign_id
  end
end
