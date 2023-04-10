class Neighborhood < ApplicationRecord
  has_many :venues
  has_many :events, -> { where("start_date <= ? and end_date >= ?", Time.now, Time.now) }, through: :venues

  default_scope { order(:name) }
end
