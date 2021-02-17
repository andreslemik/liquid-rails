# frozen_string_literal: true

if ENV['CI'] || ENV['COVERAGE']
  require 'coveralls'
  require 'simplecov'

  SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter

  SimpleCov.start do
    add_filter 'drop_example_group.rb'
    add_filter 'tag_example_group.rb'
    add_filter 'spec'
    add_filter 'gemfiles'
  end
end

# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require File.expand_path('dummy/config/environment.rb', __dir__)
require 'pry'
require 'liquid-rails'
require 'rspec/rails'
require 'capybara/rspec'
require 'liquid-rails/matchers'

Liquid::Template.error_mode = :strict

Rails.backtrace_cleaner.remove_silencers!

# Load support files
require 'fixtures/poro'
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].sort.each { |f| require f }

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.include Capybara::RSpecMatchers
  config.include ActionController::TestCase::Behavior

  config.include Liquid::Rails::Rspec::TagExampleGroup, type: :tag, file_path: %r{spec/tags}
  config.include Liquid::Rails::Rspec::DropExampleGroup, type: :drop, file_path: %r{spec/drops}
  config.include Liquid::Rails::Rspec::FilterExampleGroup, type: :filter, file_path: %r{spec/filters}
end
