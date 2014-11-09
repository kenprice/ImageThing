source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 2.3.0'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

#custome gems
#gem "therubyracer"
#gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails"
gem 'bootstrap-sass', '~> 3.2.0'

gem 'jquery-ui-rails'
gem 'bootstrap-slider-rails'

# Use ActiveModel has_secure_password
gem 'bcrypt'
gem 'bcrypt-ruby'

#Paperclip for image upload and processing
gem "paperclip", "~> 4.2"
#Image manipulation, lighter than rmagick
gem "mini_magick", "~> 4.0.0.rc"

#pagination
gem 'will_paginate',           '3.0.7'
gem 'bootstrap-will_paginate', '0.0.10'

group :development, :test do
  gem 'sqlite3'
  gem 'byebug',      '3.4.0'
  gem 'web-console', '2.0.0.beta3'
  gem 'spring',      '1.1.3'
end

group :test do
	gem 'cucumber-rails', :require => false
	gem 'rspec'
	gem 'database_cleaner'
	gem 'selenium-webdriver'
  gem 'simplecov', :require => false #test coverage
end


group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end


group :production do
  gem 'pg',             '0.17.1'  #use PostgreSQL
  gem 'rails_12factor', '0.0.2'
  gem 'unicorn',        '4.8.3'   #use unicorn app server
end

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

