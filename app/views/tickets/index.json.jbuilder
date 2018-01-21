json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :ticket_type, :total_seats, :available_seats, :reserved_seats
  json.url ticket_url(ticket, format: :json)
end
