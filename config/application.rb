require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SIGS
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.assets.enabled = true
    config.assets.paths << "#{Rails.root}/app/assets/fonts"
    config.active_record.time_zone_aware_types = [:datetime, :time]
    config.autoload_paths += %W(#{config.root}/lib)

    # Makes exception_handler gem available in dev environment
    config.exception_handler = { dev: true }

  end
end
