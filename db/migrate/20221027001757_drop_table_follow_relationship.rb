class DropTableFollowRelationship < ActiveRecord::Migration[6.1]
  def change
    drop_table :follow_relationships
  end
end
