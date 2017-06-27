class CreateLitters < ActiveRecord::Migration[5.1]
  def change
    create_table :litters do |t|
      t.integer :amount
      t.boolean :cleaned
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
