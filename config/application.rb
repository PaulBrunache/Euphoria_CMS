require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EuphoriaCms
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework      :minitest, spec: true, fixture_replacement: :fabrication
      g.fixture_replacement :fabrication, dir: "test/fabricators"
     #g.assets            true
     #g.helper            true
     #g.test_framework    true
      g.jbuilder          false
    end
    config.sass.preferred_syntax = :sass
    config.active_record.raise_in_transactional_callbacks = true
  end
end
