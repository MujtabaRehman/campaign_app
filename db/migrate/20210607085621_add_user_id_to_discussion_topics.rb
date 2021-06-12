class AddUserIdToDiscussionTopics < ActiveRecord::Migration[6.1]
  def change
    add_column :discussion_topics, :user_id, :integer
    add_index :discussion_topics, :user_id
  end
end
