class AddAddressToEvent < ActiveRecord::Migration[5.1]
  def change
    add_reference :addresses, :event, index: true
  end
end
