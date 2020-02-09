# frozen_string_literal: true

class Api::V1::CitiesController < API::V1::ApiController
  before_action :set_city, only: %i[show update destroy]

  def index
    @cities = City.all
    render json: serialize_city_to_json(@cities)
  end

  def show
    city_json = serialize_city_to_json(@city)
    render json: city_json
  end

  def create
    @city = City.new(city_params)

    if @city.save
      render json: serialize_city_to_json(@city), status: :created
    else
      render json: @city.errors, status: :unprocessable_entity
    end
  end

  def update
    if @city.update(city_params)
      render json: serialize_city_to_json(@city)
    else
      render json: @city.errors
    end
  end

  def destroy
    @city.destroy
    render json: {message: 'Cidade Apagada com Sucesso'}
  end

  private

  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:description, :country)
  end

  def serialize_city_to_json(city)
    CitySerializer.new(city).serialized_json
  end
end
