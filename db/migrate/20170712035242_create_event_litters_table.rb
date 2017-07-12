class CreateEventLittersTable < ActiveRecord::Migration[5.1]
  def change
    create_table :event_litters do |t|
      t.references :event, foreign_key: true, index: true
      t.references :litter, foreign_key: true, index: true
    end
  end
end
