class Api::V1::PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show update destroy ]
  before_action :authenticate_user!, only: %i[ create update destroy ]

  # GET /properties
  def index
    @properties = Property.all

    render json: @properties
  end

  # GET /properties/1
  def show
    render json: @property
  end

  # POST /properties
  def create
    @property = Property.new(property_params)

    if @property.save
      render json: @property, status: :created
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /properties/1
  def update
    if current_user == @property.user
      if @property.update(property_params)
        render json: @property
      else
        render json: @property.errors, status: :unprocessable_entity
      end
    else
      render json: { message: 'Only the owner of the property can update it' }, status: :unauthorized
    end
  end

  # DELETE /properties/1
  def destroy
    if current_user == @property.user
      @property.destroy!
    else
      render json: { message: 'Only the owner of the property can delete it' }, status: :unauthorized
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:title, :price, :description, :user_id)
    end
end
