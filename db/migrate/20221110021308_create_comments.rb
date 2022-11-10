class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true
      t.references :user, null: false, foregin_key: true
      t.text :comment

      t.timestamps
    end
  end
end
