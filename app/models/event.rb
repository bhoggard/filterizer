class Event < ApplicationRecord
  belongs_to :venue
  validates :title, :venue_id, :start_date, :end_date, presence: true
  validates :website, allow_blank: true, format: {with: URI::DEFAULT_PARSER.regexp[:ABS_URI]}
  validate :start_before_end

  default_scope { order(:end_date) }

  def url
    website.blank? ? venue.website : website
  end

  private

  def start_before_end
    start_date <= end_date
  end
end
