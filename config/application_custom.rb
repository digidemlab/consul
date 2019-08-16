module Consul
  class Application < Rails::Application
      config.middleware.use Rack::Attack
  end
end
