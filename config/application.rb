require File.expand_path('../boot', __FILE__)

require 'csv'
require 'rails/all'
require 'json'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BeatrixKiddo
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Eastern Time (US & Canada)'

    # Precompile image and font assets
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif *.svg)
    config.assets.precompile += %w(*.eot *.woff *.woff2 *.ttf)

    # Autoload all lib subdirectories
    config.autoload_paths += Dir[Rails.root.join('lib', '**/') ]

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
