json.data @events do |event|
  json.partial! 'event', event: event
end

json.paging do
  json.limit        @events.per_page
  json.current_page @events.current_page

  json.previous (@events.current_page > 1 ? "/events?page=#{@events.current_page - 1}&limit=#{@events.per_page}" : nil)
  json.next     (@events.current_page < @events.total_pages ? "/events?page=#{@events.current_page + 1}&limit=#{@events.per_page}" : nil)
end