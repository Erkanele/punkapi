require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe "GET #index" do
    it "displays an error message if the request fails" do
      # Stub and mimic a response from the endpoint to simulate a failed request
      allow(HTTParty).to receive(:get).and_return(double(success?: false, code: 404, message: "Not Found"))

      # Send a GET request to the index action
      get :index

      # Assert that the flash error message is set
      expect(flash[:error]) == ("The requested resource was not found.")
    end
  end
end