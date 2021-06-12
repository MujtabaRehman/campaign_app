class CreateDiscussionTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :discussion_topics do |t|
      t.string :title

      t.timestamps
    end
  end
end
