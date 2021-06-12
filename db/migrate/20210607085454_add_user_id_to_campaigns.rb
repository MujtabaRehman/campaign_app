class AddUserIdToCampaigns < ActiveRecord::Migration[6.1]
  def change
    add_column :campaigns, :user_id, :integer
    add_index :campaigns, :user_id
  end
end
