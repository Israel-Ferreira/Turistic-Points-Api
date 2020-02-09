# frozen_string_literal: true

class Api::V1::TuristicPointsController < Api::V1::ApiController
  before_action :set_turistic_point, only: %i[show update destroy]

  def index
    @turistic_points = TuristicPoint.all
    render json: serialize_tur_point_to_json(@turistic_points)
  end

  def show
    render json: serialize_tur_point_to_json(@turistic_point)
  end

  def create
    @turistic_point = TuristicPoint.new(turistic_point_params)

    if @turistic_point.save
      render json: serialize_tur_point_to_json(@turistic_point), status: :created
    else
      render json: @turistic_point.errors
    end
  end

  def update
    if @turistic_point.update(turistic_point_params)
      render json: serialize_tur_point_to_json(@turistic_point)
    else
      render json: @turistic_point.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @turistic_point.destroy 
    render json: {message: 'Ponto Turistico Criado com Sucesso'}
  end

  private

  def set_turistic_point
    @turistic_point = TuristicPoint.find(params[:id])
  end

  def serialize_tur_point_to_json(tur_point)
    options = {}
    options[:include] = [:city, :'city.description', :'city.country']
    TuristicPointSerializer.new(tur_point, options).serialized_json
  end

  def turistic_point_params
    params.require(:turistic_point).permit(:name, :image, :city_id)
  end
end
