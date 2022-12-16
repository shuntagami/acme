module Acme
  module Routes
    class Healthcheck < Base
      get '/_healthcheck' do
        ActiveRecord::Base.connection.execute('select 1')
        h = { msg: 'ok' }

        status 200
        content_type 'application/json'
        body h.to_json
      end
    end
  end
end
