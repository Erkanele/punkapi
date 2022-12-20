# README
***

**Features added to the App:**
- Used https://api.punkapi.com/v2/beers endpoint to retrieve data.
- Search function to search for desired beer.
- Filtered searched beer by name.
- Paginated list of the search result with 10 items per view.
- Implemented some test coverage with Gem rspec to check connection and parameters

## Pre-requisites:
- Ruby (v3.1.3)
- Bundler version 2.3.26
- RSpec 3.12

## Running
### 1. Download project and open it in desired development environment

### 2. Download the dependencies
 - Go to root of project and run
$ bundle install

### 3. Start the app

$ rails server

Head over to [http://localhost:3000/] to
interact with the API and search for desired beer to get associated
information about that beer.

### 3. Run test with Rspec
Run individual tests:
$ ./spec/requests/beer_spec.rb
$ ./spec/controllers/search_controller_spec.rb
  Or
  Run both with:
  $ rspec rspec

## Gems used:
- [HTTParty](https://github.com/jnunemaker/httparty)
- [kaminari](https://github.com/kaminari/kaminari)
- [rspec](https://github.com/rspec/rspec-rails)

