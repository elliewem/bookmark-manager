ENV['RACK_ENV'] = 'test'
require_relative '../app/app.rb'
require_relative '../app/models/link.rb'
require 'capybara'
require 'capybara/rspec'
require 'sinatra/flash'
require 'rspec'
require 'features/web_helpers.rb'

Capybara.app = BookMarkManager

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
