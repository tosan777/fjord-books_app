class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.references :user, null: false, foregin_key: :true
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
