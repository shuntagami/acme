module Acme
  module Routes
    def self.registered(app)
      app.use Healthcheck
    end
  end
end
