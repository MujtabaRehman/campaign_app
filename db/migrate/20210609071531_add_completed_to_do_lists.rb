class AddCompletedToDoLists < ActiveRecord::Migration[6.1]
  def change
    add_column :do_lists, :completed, :boolean
  end
end
