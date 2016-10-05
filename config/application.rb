require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CutCutCut
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # M. Hartl: this string must make bootstrap work
    config.assets.precompile += [ 'application.js', 'variable.js', 'custom.js']
    config.assets.precompile += [ 'application.css', 'variable.css', 'custom.css']
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    config.assets.initialize_on_precompile = false
  end
end
