# README
***

**Features added to the App:**
- Used https://api.punkapi.com/v2/beers endpoint to retrieve data.
- Search function to search for desired beer.
- Filtered searched beer by name.
- Paginated list of the search result with 10 items per view.

## Pre-requisites:
- Ruby (v3.1.3)
- Bundler version 2.3.26

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

## Gems used:
- [HTTParty](https://github.com/jnunemaker/httparty)
- [kaminari](https://github.com/kaminari/kaminari)

## TODO
- Update search function for empty responses
- Update documentation in files