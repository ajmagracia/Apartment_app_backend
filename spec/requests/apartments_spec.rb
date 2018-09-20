require 'rails_helper'

describe 'Apartments API' do
  # INDEX
  it 'gets a list of Apartments' do
    # Create a new apartment in the Test Database (not the same one as development)
    Apartment.create(street1: '420 Blaze It.', street2: 'Apartment 4', city: 'San Diego', state: 'New Mexico', postal_code: 23234, country: 'Mexico', manager_name: 'Bob Schmob', phone_number: '111-222-3333', contact_hours: 'none')
    Apartment.create(street1: '420 Blaze It.', street2: 'Apartment 4', city: 'San Diego', state: 'New Mexico', postal_code: 23234, country: 'Mexico', manager_name: 'Bob Schmob', phone_number: '111-222-3333', contact_hours: 'none')

    # Make a request to the API
    get '/apartments'

    # Convert the response into a Ruby Hash
    json = JSON.parse(response.body)

    # Assure that we got a successful response
    expect(response).to be_successful

    # Assure that we got one result back as expected
    expect(json.length).to eq 2
  end

  # CREATE
  it 'creates an apartment' do
    # The params we are going to send with the request
    apartment_params = {
        apartment: {
          street1: '420 Blaze It.', street2: 'Apartment 4', city: 'San Vegas', state: 'New Mexico', postal_code: 23234, country: 'Mexico', manager_name: 'Bob Schmob', phone_number: '111-222-3333', contact_hours: 'none'
        }
    }

    # Send the request to the server
    post '/apartments', params: apartment_params

    # Assure that we get a success back
    expect(response).to be_successful

    # Look up the apartment we expect to be created in the Database
    new_apartment = Apartment.first

    # Assure that the created apartment has the correct attributes
    expect(new_apartment.city).to eq('San Vegas')
  end

  # SHOW
  it 'gets a specified apartment' do
    # Create two apartments
    apartment1 = Apartment.create(street1: '420 Blaze It.', street2: 'Apartment 4', city: 'San Diego', state: 'New Mexico', postal_code: 23234, country: 'Mexico', manager_name: 'Bob Schmob', phone_number: '111-222-3333', contact_hours: 'none')

    apartment2 = Apartment.create(street1: '420 Blaze It.', street2: 'Apartment 4', city: 'San Vegas', state: 'New Mexico', postal_code: 23234, country: 'Mexico', manager_name: 'Bob Schmob', phone_number: '111-222-3333', contact_hours: 'none')

    # Send the request to the server
    get "/apartments/#{apartment2.id}"

    # Assure that we get a success back
    expect(response).to be_successful

    # Convert the response into a Ruby Hash
    json = JSON.parse(response.body)

    # Assure that we correct result back
    # expect(json).to include('city' => 'San Vegas')
    expect(json['city']).to eq('San Vegas')
  end

  # UPDATE
  it 'can make changes to an existing apartment' do
    # we will apply these changes to the apartment we create
    apartment_params = {
      apartment: {
        street1: '420 Blaze It.', street2: 'Apartment 4', city: 'Albacore-key', state: 'New Mexico', postal_code: 23234, country: 'Mexico', manager_name: 'Bob Schmob', phone_number: '111-222-3333', contact_hours: 'none'
      }
    }

    # create apartment
    update_apartment = Apartment.create( street1: 'yuh', street2: 'yuhh', city: 'Yuh Dieguh', postal_code: 10101, state:'YUH', country: 'Yuhnited States', manager_name: 'Yuh Yuh', phone_number: 'yuhyuhyuh', contact_hours: 'yuh yuh-yuh')

    # Apply changes
    patch "/apartments/#{update_apartment.id}", params: apartment_params

    json = JSON.parse(response.body)
    expect(response).to have_http_status(200)

    # Make sure things were changed properly
    expect(json['city']).to eq('Albacore-key')

  end

  # DESTROY
  it 'can destroy a specified apartment' do
    # Create two apartments
    apartment1 = Apartment.create(street1: '420 Blaze It.', street2: 'Apartment 4', city: 'San Diego', state: 'New Mexico', postal_code: 23234, country: 'Mexico', manager_name: 'Bob Schmob', phone_number: '111-222-3333', contact_hours: 'none')

    apartment2 = Apartment.create(street1: '420 Blaze It.', street2: 'Apartment 4', city: 'San Vegas', state: 'New Mexico', postal_code: 23234, country: 'Mexico', manager_name: 'Bob Schmob', phone_number: '111-222-3333', contact_hours: 'none')

    get "/apartments/#{apartment1.id}"
    expect(response).to be_successful

    delete "/apartments/#{apartment1.id}"

    # Assure an apartment was deleted
    get '/apartments'
    json = JSON.parse(response.body)
    expect(json.length).to be 1

    # Assure the correct apartment was deleted
    expect(json[0]).to include('city' => 'San Vegas')
  end

end
