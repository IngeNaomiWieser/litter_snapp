class AddImageToLitter < ActiveRecord::Migration[5.1]
  def change
    add_column :litters, :image, :string
  end
end
