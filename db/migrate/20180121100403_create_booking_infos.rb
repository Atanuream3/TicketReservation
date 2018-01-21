class CreateBookingInfos < ActiveRecord::Migration
  def change
    create_table :booking_infos do |t|
      t.string :User_Name
      t.string :email
      t.string :Ticket_Type
      t.integer :No_Of_Tickets
      t.integer :Advance

      t.timestamps null: false
    end
  end
end
