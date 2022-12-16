module Acme
  module Routes
    class Welcome < Base
      get '/' do
        h = { msg: 'ok' }

        status 200
        content_type 'application/json'
        body h.to_json
      end
    end
  end
end
