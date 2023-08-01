require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsAzureAdDemo
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.after_initialize do
      # Disable forking in macOS to avoid the fork-related crash.
      if RUBY_PLATFORM =~ /darwin/
        ActiveSupport.on_load(:active_record) do
          module ActiveRecord
            module ConnectionAdapters
              class ConnectionPool
                def prevent_forking
                  @reserved_connections.each_value do |conn|
                    conn.raw_connection.close
                  end
                  @reserved_connections.clear
                end
              end
            end
          end
        end
      end
    end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
