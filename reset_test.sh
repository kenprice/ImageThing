#!/bin/bash
rake db:reset RAILS_ENV=test
rake db:migrate RAILS_ENV=test