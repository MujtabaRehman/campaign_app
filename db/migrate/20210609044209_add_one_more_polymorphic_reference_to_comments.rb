class AddOneMorePolymorphicReferenceToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :commented, polymorphic: true, null: false
  end
end
