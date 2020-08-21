class API::V1::DealershipsController < ApplicationController

    before_action :set_dealership, only: [:show, :update, :destroy]
    skip_before_action :authenticate, only: [:index, :show]

    # GET /dealerships
    def index
        @dealerships = Dealership.all
        render json: @dealerships
    end

    #GET /dealerships/1
    def show
        render json: { dealership: @dealership }
    end

    #POST /dealerships
    def create
        @dealership = Dealership.new(dealership_params)
        if @dealership.save
            render json: @dealership
        else  
            render json: @dealership.errors, status: :unprocessable_entity
        end
    end

    #PATCH/PUT /dealerships/1
    def update
        if @dealership.update(dealership_params)
            render json: @dealership
        else  
            render json: @dealership.errors, status: :unprocessable_entity
        end
    end

    #DELETE /dealerships/1
    def destroy
        @dealership.destroy
    end

    private

    def set_dealership
        @Dealership = Dealership.find(params[:id])
    end

    def dealership_params
        params.require(:dealership).permit(:name, :city, :state, :owner, :image)
    end


end
