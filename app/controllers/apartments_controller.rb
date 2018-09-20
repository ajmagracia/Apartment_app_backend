class ApartmentsController < ApplicationController
    def index
      apartments = Apartment.all
      render json: apartments
    end

    def create
      # Create a new apartment
      apartment = Apartment.create(apartment_params)

      # respond with our new apartment
      render json: apartment
    end

    def show
        id = params[:id]
    	apartment = Apartment.find_by_id "#{id}"
      	render json: apartment
    end

    def update
        id = params[:id]
        apartment = Apartment.update(id, apartment_params)
        render json: apartment
    end

    def destroy
        id = params[:id]
        Apartment.find(id).destroy
    end

    # Handle strong parameters, so we are secure
    def apartment_params
      params.require(:apartment).permit(:street1, :street2, :city, :state, :postal_code, :country, :manager_name, :phone_number, :contact_hours)
    end
end
