class CreateDoLists < ActiveRecord::Migration[6.1]
  def change
    create_table :do_lists do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
