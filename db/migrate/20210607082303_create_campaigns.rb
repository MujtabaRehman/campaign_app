class CreateCampaigns < ActiveRecord::Migration[6.1]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :purpose
      t.integer :estimated_time

      t.timestamps
    end
  end
end
