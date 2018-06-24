require 'rubygems'
require 'rest_client'
require 'json'

class PblabelAdapter < ApplicationRecord

  def self.create_label(company, name, phone, email, residential, addressLines, cityTown, stateProvince, postalCode, countryCode)

    base_uri = 'https://api-sandbox.pitneybowes.com/shippingservices/v1/shipments'

    site = RestClient::Resource.new(base_uri)

    request = {
      "fromAddress": {
        "company": company,
        "name": name,
        "phone": phone,
        "email": email,
        "residential": residential,
        "addressLines": [
          addressLines
        ],
        "cityTown": cityTown,
        "stateProvince": stateProvince,
        "postalCode": postalCode,
        "countryCode": countryCode,
        "status": "NOT_CHANGED"
      },
      "toAddress": {
        "company": "Glorias Co.",
        "name": "Peter",
        "phone": "2222222222",
        "email": "receiver@email.com",
        "residential": true,
        "addressLines": [
          "1 Sullivan SQ"
        ],
        "cityTown": "Berwick",
        "postalCode": "03901",
        "countryCode": "US",
        "status": "NOT_CHANGED"
      },
      "parcel": {
        "weight": {
          "unitOfMeasurement": "OZ",
          "weight": 1
        },
        "dimension": {
          "unitOfMeasurement": "IN",
          "length": 6,
          "width": 0.25,
          "height": 4,
          "irregularParcelGirth": 0.002
        }
      },
      "rates": [
        {
          "carrier": "USPS",
          "serviceId": "PM",
          "parcelType": "PKG",
          "specialServices": [
            {
              "specialServiceId": "Ins",
              "inputParameters": [
                {
                  "name": "INPUT_VALUE",
                  "value": "50"
                }
              ]
            },
            {
              "specialServiceId": "DelCon",
              "inputParameters": [
                {
                  "name": "INPUT_VALUE",
                  "value": "0"
                }
              ]
            }
          ],
          "inductionPostalCode": "06484"
        }
      ],
      "documents": [
        {
          "type": "SHIPPING_LABEL",
          "contentType": "URL",
          "size": "DOC_8X11",
          "fileFormat": "PDF",
          "printDialogOption": "NO_PRINT_DIALOG"
        }
      ],
      "shipmentOptions": [
        {
          "name": "SHIPPER_ID",
          "value": "9015297803"
        },
        {
          "name": "ADD_TO_MANIFEST",
          "value": "false"
        }
      ]
    }.to_json

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