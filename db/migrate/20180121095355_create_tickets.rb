class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :ticket_type
      t.integer :total_seats
      t.integer :available_seats
      t.integer :reserved_seats

      t.timestamps null: false
    end
  end
end
