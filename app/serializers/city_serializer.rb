class CitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :description, :country
  has_many :turistic_points
end
