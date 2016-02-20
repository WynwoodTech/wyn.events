require 'rails_helper'

RSpec.describe Event, type: :model do
  context "creation" do
    let(:start_time) { Time.now }
    let(:organizer) { Organizer.new }
    let(:event) { Event.new(organizer: organizer, title: 'lipsum title', start_time: start_time) }

    it "validates event has title and organizer" do
      event.end_time = start_time + 10.minutes
      expect(event.save!).to be_truthy
    end

    it "validates event ends after start time" do
      event.end_time = start_time - 1.hours
      expect { event.save! }.to raise_error(ActiveRecord::RecordInvalid)

      event.end_time = start_time + 1.minutes
      expect(event.valid?).to be true
    end
  end
end
