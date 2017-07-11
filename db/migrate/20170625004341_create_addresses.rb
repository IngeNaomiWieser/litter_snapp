class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :line_1
      t.string :city
      t.string :postal_code
      t.string :province
      t.string :country
      t.references :user, foreign_key: true, index: true 

      t.timestamps
    end
  end
end
