module Acme
  module Routes
    def self.registered(app)
      app.use Healthcheck
      app.use UsersRoutes
    end
  end
end
