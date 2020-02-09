class TuristicPointSerializer
  include FastJsonapi::ObjectSerializer
  set_type :turistic_point
  set_id :city_id
  attributes :name, :image
  belongs_to :city
end
