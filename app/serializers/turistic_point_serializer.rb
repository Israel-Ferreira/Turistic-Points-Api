class TuristicPointSerializer
  include FastJsonapi::ObjectSerializer
  set_id :serializer_id
  set_type :turistic_point
  set_id :city_id
  attributes :name, :image
  belongs_to :city
end
