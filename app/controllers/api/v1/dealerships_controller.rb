class Api::V1::DealershipsController < ApplicationController

    before_action :set_dealership, only: [:show, :update, :destroy]
    skip_before_action :authenticate, only: [:index, :show, :getDealershipById]

    # GET /dealerships
    def index
        @dealerships = Dealership.all
        render json: @dealerships
    end

    # GET /dealerships/1
    def show
        @cars = Car.where(dealership_id: params[:id])
        render json: { dealership: @dealership, cars: @cars }
    end

    def getDealershipById
        @dealership = Dealership.find(params[:id])
        render json: @dealership
    end

    # POST /dealerships
    def create
        @dealership = Dealership.new(dealership_params)
        if @dealership.save
            render json: @dealership
        else  
            render json: @dealership.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /dealerships/1
    def update
        if @dealership.update(dealership_params)
            render json: @dealership
        else  
            render json: @dealership.errors, status: :unprocessable_entity
        end
    end

    # DELETE /dealerships/1
    def destroy
        @dealership.destroy
    end

    # Get our Amazon S3 Keys for image uploads
    def get_upload_credentials
        @accessKey = ENV['S3_ACCESS']
        @secretKey = ENV['S3_SECRET']
        render json: { accessKey: @accessKey, secretKey: @secretKey}
    end

    private

    def set_dealership
        @dealership = Dealership.find(params[:id])
    end

    def dealership_params
        params.require(:dealership).permit(:name, :city, :state, :owner, :image)
    end


end
