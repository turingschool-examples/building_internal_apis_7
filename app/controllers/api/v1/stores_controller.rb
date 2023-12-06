class Api::V1::StoresController < ApplicationController
  #optional: 
  # rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

  def index
    render json: StoreSerializer.new(Store.all)
  end

  def show
    begin
      render json: StoreSerializer.new(Store.find(params[:id]))
    rescue ActiveRecord::RecordNotFound => exception
      render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 404)).serialize_json, status: :not_found
    end
  end

  private
  def not_found_response(exception)
    render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 404)).serialize_json, status: :not_found
  end

end