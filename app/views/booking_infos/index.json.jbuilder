json.array!(@booking_infos) do |booking_info|
  json.extract! booking_info, :id, :User_Name, :email, :Ticket_Type, :No_Of_Tickets, :Advance
  json.url booking_info_url(booking_info, format: :json)
end
