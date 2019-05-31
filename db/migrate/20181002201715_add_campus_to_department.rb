class AddCampusToDepartment < ActiveRecord::Migration[5.0]
  def change
    add_reference :departments, :campus, foreign_key: true
  end
end
