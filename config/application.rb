require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Techdemo
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Loading bower installed stuff
    config.assets.paths << Rails.root.join('vendor', 'assets', 'components')

    config.assets.precompile += %w( chat.js )
  end
end
