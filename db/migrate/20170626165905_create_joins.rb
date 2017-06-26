class CreateJoins < ActiveRecord::Migration[5.1]
  def change
    create_table :joins do |t|
      t.boolean :is_organizer
      t.references :user, foreign_key: true, index: true
      t.references :event, foreign_key: true, index: true

      t.timestamps
    end
  end
end
