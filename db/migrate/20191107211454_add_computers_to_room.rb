class AddComputersToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :computers, :integer
  end
end
