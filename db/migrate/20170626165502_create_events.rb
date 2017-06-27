class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.date :planned_date
      t.time :planned_time
      t.boolean :complete

      t.timestamps
    end
  end
end
