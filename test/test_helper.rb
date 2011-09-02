require 'paperclip-defaults'
require 'minitest/autorun'
require 'active_record'
require 'mocha'

include Mocha::API

# Define action controller namespace if it does not exist already
unless defined?(ActionController)
  module ActionController
  end
end

# Create a mock for ActionController::Base unless it already exists
ActionController.const_set(:Base, mock('action_controller')) unless defined?(ActionController::Base)

# Create a mock for Rails unless it already exists
Object.const_set(:Rails, mock('rails')) unless defined?(Rails)

# Include Paperclip in ActiveRecord::Base (this will happen automatically in Rails)
ActiveRecord::Base.send(:include, Paperclip::Glue)
