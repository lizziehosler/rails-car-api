class AddNotesToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :notes, :string
  end
end
