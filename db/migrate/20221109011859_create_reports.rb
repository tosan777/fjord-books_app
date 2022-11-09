class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.integer :user_id
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
