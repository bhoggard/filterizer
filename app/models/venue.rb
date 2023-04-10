class Venue < ApplicationRecord
  belongs_to :neighborhood
  has_many :events
  validates :name, :address, :neighborhood_id, presence: true
  validates :website, format: {with: URI::DEFAULT_PARSER.regexp[:ABS_URI]}
end
