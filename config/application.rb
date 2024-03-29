require_relative 'boot'

require 'csv'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EquinoxAdmin
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.assets.check_precompiled_asset = false
    config.load_defaults 6.0
    config.autoload_paths += %W(#{config.root}/lib)
    config.i18n.available_locales = [:en, :es]
    config.i18n.default_locale = :en
    config.i18n.fallbacks = [I18n.default_locale]
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.hosts << /(.*\.)?lvh.me/
    config.hosts << /(.*\.)?equinox-admin.herokuapp.com/
    config.hosts << /(.*\.)?avenist.com/
    config.active_job.queue_adapter = :sidekiq
  end
end
