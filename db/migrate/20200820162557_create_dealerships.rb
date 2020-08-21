class CreateDealerships < ActiveRecord::Migration[6.0]
  def change
    create_table :dealerships do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :owner
      t.string :image

      t.timestamps
    end
  end
end
