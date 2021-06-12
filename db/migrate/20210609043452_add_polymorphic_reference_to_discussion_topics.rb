class AddPolymorphicReferenceToDiscussionTopics < ActiveRecord::Migration[6.1]
  def change
    add_reference :discussion_topics, :topic_creator, polymorphic: true, null: false
  end
end
