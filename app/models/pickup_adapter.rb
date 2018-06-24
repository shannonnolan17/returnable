require 'rubygems'
require 'rest_client'
require 'json'

class PickupAdapter < ApplicationRecord

  def self.create_pickup(company, name, phone, email, residential, addressLines, cityTown, stateProvince, postalCode, countryCode, packageLocation, specialInstructions, carrier)

    base_uri = 'https://api-sandbox.pitneybowes.com/shippingservices/v1/pickups/schedule'

    site = RestClient::Resource.new(base_uri)

    request = {
    "pickupAddress": {
        "addressLines": [
            addressLines,
            "",
            ""
        ],
        "cityTown": cityTown,
        "stateProvince": stateProvince,
        "postalCode": postalCode,
        "countryCode": countryCode,
        "company": company
        "name": name,
        "phone": phone,
        "email": email,
        "residential": residential,
        "taxId": "12345678"
    },
    "carrier": carrier,
    "pickupSummary": [ {
        "serviceId": "INT",
        "count": 9,
        "totalWeight": {
            "unitOfMeasurement": "OZ",
            "weight": "480"
        }
    }, ... ],
    "reference": "example_reference",
    "packageLocation": packageLocation,
    "specialInstructions": specialInstructions}.to_json

    p request
    p "**************"


    begin
      response = site.post(request, headers = {'Authorization'=> 'Bearer zeqoehkeVWtO7tte3mnoRl8SsnVA', 'X-PB-TransactionId'=> 2, :content_type=>'application/json'})
      puts response
    rescue RestClient::Exception => exception
      puts 'API Error'
      puts "Response Code: #{exception.response.code} Response Body: #{exception.response.body} "
    end

  end


end