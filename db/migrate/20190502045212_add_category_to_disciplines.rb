class AddCategoryToDisciplines < ActiveRecord::Migration[5.0]
  def change
    add_column :disciplines, :category, :integer
  end
end
