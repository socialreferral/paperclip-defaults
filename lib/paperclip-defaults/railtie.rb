module Paperclip
  module Defaults
    class Raitlie < Rails::Railtie
      config.paperclip_defaults = ActiveSupport::OrderedOptions.new
    end
  end
end
