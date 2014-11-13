### README
This is based on the ImageSpace git. It is still called ImageSpace, however the name will change in later versions.

Author: Ken Price, Jordan Ross

## Set up
* `bundle install` to install dependencies

* `bundle exec rake db:migrate` to set up

* Run server with `rails server`

* Go to your web browser and open "http://localhost:3000"

## To run tests

For unit and integration tests:
* Run `bundle exec rake test`

For functional testing with Cucumber:
* First run `rails s -e test` to run server in test environment
* Then run `bundle exec cucumber`
* You may need to set up database for test environment. Use `bundle exec rake db:migrate RAILS_ENV=test"