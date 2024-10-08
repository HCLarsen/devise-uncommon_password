require_relative 'boot'

require 'rails/all'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)
require "devise/uncommon_password"

module Dummy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
