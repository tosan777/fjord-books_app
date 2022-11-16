class CreateFollowRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :follow_relationships do |t|
      t.integer :follower_id, null: false, foregin_key: true
      t.integer :followed_id, null: false, foregin_key: true

      t.timestamps
    end
    add_index :follow_relationships, [:follower_id, :followed_id], unique: true
  end
end
