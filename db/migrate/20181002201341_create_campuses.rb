class CreateCampuses < ActiveRecord::Migration[5.0]
  def change
    create_table :campuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
