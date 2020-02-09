# frozen_string_literal: true

class TuristicPoint < ApplicationRecord
  belongs_to :city, dependent: :destroy
  validates :name, :image, presence: true
end
