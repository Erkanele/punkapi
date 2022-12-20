class SearchController < ApplicationController
  
  def index 
    filter_by = params[:filter_by]
    # Endpoint
    url = 'https://api.punkapi.com/v2/beers?per_page=80'
    # Query
    query = {
      beer_name: params[:name],
      abv: params[:abv],
      description: params[:description],
      food_pairing: params[:food]
    }
    
    # Send the GET request to endpoint
    response = HTTParty.get(url, query)
    if response.success?
      puts "Connection is up and running"
      # Parse the response body as JSON
      # Use ternary operator to assign filter from endpoint request,
      # No filter if none added, otherwise use filter that entered in search box
      @some_beers = filter_by.nil? ? 
      response.parsed_response : 
      response.parsed_response.filter{|beer|beer["name"].downcase.include? filter_by}
      @beers = Kaminari.paginate_array(@some_beers).page(params[:page]).per(10)
    else
      case response.code
        when 404
        # Display an error message to the user
        flash[:error] = "The requested resource was not found."
        # Log the error for debugging purposes
        Rails.logger.error "Error: #{response.code} - #{response.message}"
        when 500...599
        # Display a generic error message to the user
        flash[:error] = "An error occurred on the server. Please try again later."
        # Log the error for debugging purposes
        Rails.logger.error "Error: #{response.code} - #{response.message}"
        end
    end
  end
# Redirect user to / if empty value
# otherwise downcase input and assign it to parameter variable
# and redirect to index action with filter_by query of parameter
  def search
    if params[:q].blank?
      redirect_to "/" and return
    else 
    @parameter = params[:q].downcase
    redirect_to action: "index", filter_by: @parameter   
    end
  end
end