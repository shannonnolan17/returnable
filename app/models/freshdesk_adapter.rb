class FreshdeskAdapter < ApplicationRecord
  def create_ticket
    require 'rubygems'
    require 'rest_client'
    require 'json'

    freshdesk_domain = 'http://returnable.freshdesk.com'

    user_name_or_api_key = 'ENV["FRESHWORKS_API_KEY"]'

    password_or_x = 'X'

    json_payload = { status: 2,
                     priority: 1,
                     description: 'test ticket creation with attachments',
                     subject: 'new ticket sample',
                     cc_emails: ['myemail@testexample.com', 'test@testexample.com'],
                     email: 'shannonnolan17@gmail.com' }.to_json

    freshdesk_api_path = 'api/v2/tickets'

    freshdesk_api_url  = "https://#{freshdesk_domain}.freshdesk.com/#{freshdesk_api_path}"

    site = RestClient::Resource.new(freshdesk_api_url, user_name_or_api_key, password_or_x)

    begin
      response = site.post(json_payload, :content_type=>'application/json')
      puts "response_code: #{response.code} \n Location Header: #{response.headers[:location]}\n response_body: #{response.body}"
    rescue RestClient::Exception => exception
      puts 'API Error: Your request is not successful. If you are not able to debug this error properly, mail us at support@freshdesk.com with the follwing X-Request-Id'
      puts "X-Request-Id : #{exception.response.headers[:x_request_id]}"
      puts "Response Code: #{exception.response.code} Response Body: #{exception.response.body} "
    end
  end
end
