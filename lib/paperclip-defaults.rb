require "paperclip-defaults/version"
require "bundler/setup"

Bundler.require(:default)

require 'paperclip'

module Paperclip
  module Defaults
  end

  module ClassMethods
    alias_method :has_attached_file_without_defaults, :has_attached_file
    def has_attached_file_with_defaults(name, options = {})
      if options[:default_asset_url]
        options[:default_url] = ActionController::Base.new.view_context.asset_path(options[:default_asset_url])
        options.delete(:default_asset_url)
      end
      paperclip_options = ::Rails.application.config.paperclip_defaults.merge(options)
      has_attached_file_without_defaults(name, paperclip_options)
    end
    alias_method :has_attached_file, :has_attached_file_with_defaults
  end
end

require "paperclip-defaults/railtie" if defined?(Rails::Railtie)
