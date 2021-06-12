class DropToDoLists < ActiveRecord::Migration[6.1]
  def change
    drop_table :to_do_lists
  end
end
