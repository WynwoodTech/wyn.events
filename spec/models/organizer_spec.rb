require 'rails_helper'

RSpec.describe Organizer, type: :model do
  context "creation" do
    let(:full_name) { Faker::Name.name }
    let(:email) { Faker::Internet.email }

    it "validates is a proper Organizer" do
      expect { subject.save! }.to raise_error(ActiveRecord::RecordInvalid)

      subject.name = full_name
      subject.email= email
      expect(subject.valid?).to be true
    end
  end
end
