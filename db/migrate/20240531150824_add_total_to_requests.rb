class AddTotalToRequests < ActiveRecord::Migration[7.1]
  def change
    add_column :requests, :total, :float
  end
end
