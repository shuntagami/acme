module Acme
  module Routes
    class Healthcheck < Base
      get "/_healthcheck" do
        ActiveRecord::Base.connection.execute("select 1")
        h = { msg: "ok" }

        status 200
        body h.to_json
      end
    end
  end
end
