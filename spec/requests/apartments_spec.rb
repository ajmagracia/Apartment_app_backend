require 'rails_helper'

describe "Apartments API" do
  it "gets a list of Apartments" do
    # Create a new apartment in the Test Database (not the same one as development)
    Apartment.create(street1: '420 Blaze It.', street2: 'Apartment 4', city: 'San Diego', state: 'New Mexico', postal_code: 23234, country: 'Mexico', manager_name: 'Bob Schmob', phone_number: '111-222-3333', contact_hours: 'none')

    # Make a request to the API
    get '/apartments'

    # Convert the response into a Ruby Hash
    json = JSON.parse(response.body)

    # Assure that we got a successful response
    expect(response).to be_success

    # Assure that we got one result back as expected
    expect(json.length).to eq 1
  end

  it "creates an apartment" do
    # The params we are going to send with the request
    apartment_params = {
        apartment: {
          street1: '420 Blaze It.', street2: 'Apartment 4', city: 'San Diego', state: 'New Mexico', postal_code: 23234, country: 'Mexico', manager_name: 'Bob Schmob', phone_number: '111-222-3333', contact_hours: 'none'
        }
    }

    # Send the request to the server
    post '/apartments', params: apartment_params

    # Assure that we get a success back
    expect(response).to be_success

    # Look up the apartment we expect to be created in the Database
    new_apartment = Apartment.first

    # Assure that the created apartment has the correct attributes
    expect(new_apartment.city).to eq('San Diego')
  end
end
