class CreateNovices < ActiveRecord::Migration[6.1]
  def change
    create_table :novices do |t|

      t.timestamps
    end
  end
end
