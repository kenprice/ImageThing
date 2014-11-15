#begin
#  require 'database_cleaner'
#  require 'database_cleaner/cucumber'
#
#  DatabaseCleaner.strategy = :truncation
#rescue NameError
#  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
#end
#
#Around do |scenario, block|
#  DatabaseCleaner.cleaning(&block)
#end

require 'database_cleaner'
require 'database_cleaner/cucumber'
DatabaseCleaner.clean_with :truncation # clean once to ensure clean slate
DatabaseCleaner.strategy = :truncation

Before('@no-txn') do
  DatabaseCleaner.start
end

After('@no-txn') do
  DatabaseCleaner.clean
end

Around do |scenario, block|
  DatabaseCleaner.cleaning(&block)
end