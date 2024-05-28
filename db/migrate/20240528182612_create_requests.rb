class CreateRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :bag_id
      t.string :status
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
