json.id           event.id
json.title        event.title
json.description  event.description
json.start_time   event.start_time
json.end_time     event.end_time

json.venue do
  venue = event.venue
  json.id   venue.try(:id)
  json.name venue.try(:name)

  json.address do
    json.line_address_1 venue.try(:address_one)
    json.line_address_2 venue.try(:address_two)
    json.city           venue.try(:city)
    json.state          venue.try(:state)
    json.zip            venue.try(:zip)
  end
end

json.organizer do
  organizer = event.organizer
  json.id          organizer.try(:id)
  json.name        organizer.try(:name)
  json.email       organizer.try(:email)
  json.website     organizer.try(:website)
  json.image_url   organizer.try(:image_url)
end