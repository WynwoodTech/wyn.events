class EventsController < ApplicationController

  expose(:id)          { params[:id] }
  expose(:title)       { params[:event][:title] }
  expose(:description) { params[:event][:description] }
  expose(:start_time)  { params[:event][:start_time] }
  expose(:end_time)    { params[:event][:end_time] }
  expose(:link)        { params[:event][:url] }
  expose(:image_url)   { params[:event][:image_url] }

  expose(:venue_name)  { params[:venue][:name] }
  expose(:venue_email) { params[:venue][:email] }
  expose(:address_1)   { params[:venue][:address_1] }
  expose(:address_2)   { params[:venue][:address_2] }
  expose(:city)        { params[:venue][:city] }
  expose(:zip)         { params[:venue][:zip] }

  expose(:organizer_name)  { params[:organizer][:name] }
  expose(:organizer_image) { params[:organizer][:image] }
  expose(:organizer_url)   { params[:organizer][:website] }
  expose(:organizer_email) { params[:organizer][:email] }

  payload = {
    event: {
      title: 'title',
      description: 'description',
      start_time: 'start_time',
      end_time: 'end_time',
      url: 'url',
    },
    venue: {
      name: 'venue_name',
      email: 'email',
      address_1: 'address_1',
      address_2: 'address_2',
      city: 'city',
      zip: 'zip',
    },
    organizer: {
      name: 'organizer_name',
      image: 'organizer_image',
      website: 'organizer_website',
      email: 'organizer_email'
    }
  }

  def index
    render json: { events: Event.get_all }, status: 200
  end

  def create
    success = false
    organizer = Organizer.find_or_initialize_by(
      name:   organizer_name,
      image:  organizer_image,
      website: organizer_website,
      email:   organizer_email
    ).tap do | o |
      o.save!
      venue = o.venues.find_or_create_by(
        name: venue_name,
        address_1: address_1,
        address_2: address_2,
        state: state,
        city: city,
        zip: zip
      )
      o.events.find_or_create_by(
        title: title,
        description: description,
        image_url: image_url,
        start_time: start_time,
        end_time: end_time,
        organizer_id: o.id,
        venue_id: v.id,
      )
      success = true
    end

    if success == true
      render json: { status: 'Event created' }, status: 200
    else
      render json: { status: 'Event not created' }, status: 200
    end
  end

  def update
  end
end
