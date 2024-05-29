class AddUrlToBags < ActiveRecord::Migration[7.1]
  def change
    add_column :bags, :picture_url, :string
  end
end
