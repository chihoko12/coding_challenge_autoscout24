require_relative 'boot'

require 'rails/all'
require 'csv'

Bundler.require(*Rails.groups)

module CodingChallengeAutoscout24
  class Application < Rails::Application
    config.load_defaults 6.0
  end
end
