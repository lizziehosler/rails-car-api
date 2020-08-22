class AddImageToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :image, :string
  end
end
