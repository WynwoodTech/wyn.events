class Organizer < ActiveRecord::Base
  has_many :events

  validates :name, :email, presence: true
  validates :email, format: /.@.*\./
end
