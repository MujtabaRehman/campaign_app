class DropNoices < ActiveRecord::Migration[6.1]
  def change
    drop_table :noices
  end
end
