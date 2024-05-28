class CreateBags < ActiveRecord::Migration[7.1]
  def change
    create_table :bags do |t|
      t.string :brand
      t.string :description
      t.string :condition
      t.integer :price_per_day
      t.integer :user_id

      t.timestamps
    end
  end
end
