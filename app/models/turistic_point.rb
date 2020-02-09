class TuristicPoint < ApplicationRecord
  belongs_to :city, dependent: :destroy
  validates :description, :image, presence: true
end
