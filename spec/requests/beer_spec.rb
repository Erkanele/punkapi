require 'rails_helper'

RSpec.describe "Beers", type: :request do
  describe "GET /beers" do
    it "retrieves a list of beers from the endpoint" do
      # Send a GET request to the endpoint
      response = HTTParty.get('https://api.punkapi.com/v2/beers?per_page=80')

      # Assert that the response was successful
      expect(response.success?).to be_truthy
      p response.count

      # Parse the response body as JSON
      beers = response.parsed_response

      # Assert that the response is an array of beers
      expect(beers).to be_an(Array)
      expect(beers.first).to have_key("name")
      expect(beers.first).to have_key("description")
    end
  end
end