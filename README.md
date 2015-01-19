#Universal Rating System

## What is it?

An app to facilitate rating things. EVERYTHING.

## Prerequisites

* Ruby 2.2.0
* Bundler
* foreman (optional, but highly recommended)
* PostgreSQL (or equivalent ActiveRecord-compatible database)
* Facebook API access
    
## Running the project
    bundle install
    bundle exec rake db:create db:migrate
    foreman start

Then simply go to http://localhost:5000/ in your browser.
