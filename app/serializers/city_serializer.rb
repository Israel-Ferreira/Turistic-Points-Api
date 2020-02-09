class CitySerializer
  include FastJsonapi::ObjectSerializer
  set_id :serializer_id
  attributes :description, :country
  has_many :turistic_points
end
