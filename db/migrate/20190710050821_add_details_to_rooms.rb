class AddDetailsToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :details, :string
  end
end
