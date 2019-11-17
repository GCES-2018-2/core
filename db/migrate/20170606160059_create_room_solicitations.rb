class CreateRoomSolicitations < ActiveRecord::Migration[5.0]
  def change
    create_table :room_solicitations do |t|
      t.datetime :start, null: false
      t.datetime :final, null: false
      t.string :day, null: false
      t.string :justify
      t.date :response_date
      t.references :responder, index: true
      t.references :room,  foreign_key: true
      t.references :department,  foreign_key: true
      t.integer :status, null: false, default: 0 # 0 => pendente, 1 => Aceito, 2 => Recusado
      t.references :solicitation, foreign_key: true, null: true

      t.timestamps
    end
  end
end
