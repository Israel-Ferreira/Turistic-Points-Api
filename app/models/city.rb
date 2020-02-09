class City < ApplicationRecord
  validates :description, :country, presence: true
  has_many :turistic_points
end
