class Api::V1::CarsController < ApplicationController
    before_action :set_car, only: [:show, :update, :destroy]
    skip_before_action :authenticate, only: [:index, :show, :getCarById]

    def index
        @cars = Car.all
        render json: @cars
    end

    def show
        render json: @cars
    end

    def getCarById
        @car = Car.find(params[:id])
        render json: @car
    end

    def create
        @car = Car.new(car_params)
        if @car.save
            render json: @car
        else  
            render json: @car.errors, status: :unprocessable_entity
        end
    end

    def update
        if @car.update(car_params)
            render json: @car
        else  
            render json: @car.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @car.destroy
    end

    def get_upload_credentials
        @accessKey = ENV['S3_ACCESS']
        @secretKey = ENV['S3_SECRET']
        render json: { accessKey: @accessKey, secretKey: @secretKey}
    end

    private
    def set_car
        @car = Car.find(params[:id])
    end

    def car_params
        params.required(:car).permit(:year, :make, :model, :color, :price, :image, :notes, :dealership_id, :mileage)
    end
end
