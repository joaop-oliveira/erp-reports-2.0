require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ErpReports20
  class Application < Rails::Application
    config.assets.paths << "#{Rails.root}/app/assets/stylesheets/font-awesome-4.2.0/css/"
    config.assets.paths << "#{Rails.root}/app/assets/stylesheets/bootstrap/" #All bootstraps css files location
    config.assets.paths << "#{Rails.root}/vendor/assets/fonts"
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
