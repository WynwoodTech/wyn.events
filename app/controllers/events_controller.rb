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
  expose(:state)       { params[:venue][:state] }
  expose(:city)        { params[:venue][:city] }
  expose(:zip)         { params[:venue][:zip] }

  expose(:organizer_name)  { params[:organizer][:name] }
  expose(:organizer_image) { params[:organizer][:image] }
  expose(:organizer_url)   { params[:organizer][:website] }
  expose(:organizer_email) { params[:organizer][:email] }

  protect_from_forgery with: :null_session

  def index
    @events = Event.paginate(@pagination)
  end

  def create
    success = false
    Organizer.find_or_create_by(payload[:organizer]).tap do | o |
      venue = Venue.find_or_create_by(payload[:venue])
      venue.events.find_or_initialize_by(payload[:event]).tap do | e |
        e.update( organizer_id: o.id, venue_id: venue.id)
        e.save!
        success = true
      end
    end

    if success == true
      render json: { status: 'Event created' }, status: 200
    else
      render json: { status: 'Event not created' }, status: 200
    end
  end

  def update
  end

  private

  def payload
    {
      event: {
        title: title,
        description: description,
        start_time: start_time,
        end_time: end_time,
        image_url: image_url,
        link: link
      },
      venue: {
        name: venue_name,
        #email: venue_email,
        address_one: address_1,
        address_two: address_2,
        state: state,
        city: city,
        zip: zip
      },
      organizer: {
        name: organizer_name,
        email: organizer_email,
        website: organizer_url,
        image_url: organizer_image
      }
    }
  end

end
