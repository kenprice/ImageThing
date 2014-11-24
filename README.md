### README
ImageThing is based on the ImageSpace code provided by Scari's github page. This is a project for Tsai's CSE 360 class at ASU.

Author: Ken Price, Jordan Ross

## Set up
* `bundle install` to install dependencies

* `bundle exec rake db:migrate` to set up

* Run server with `rails server`

* Go to your web browser and open "http://localhost:3000"

## To run tests

For unit and integration tests:
* Run `bundle exec rake test`

Functional tests can be found in "/features/".
For functional testing with Cucumber:
* First run `rails s -e test` to run server in test environment

* Then run `bundle exec cucumber` in another terminal while the test server is running.

* You may need to set up database for test environment. Use `bundle exec rake db:migrate RAILS_ENV=test`

* Run `bash reset_test.sh` (in the top-level directory), which will reset the test db, before launching functional test. This concerns only functional tests done with Cucumber or RSpec with Selenium.