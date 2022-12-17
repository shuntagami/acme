module Acme
  module Routes
    class Base < Sinatra::Base
      set :root, Dir.pwd
      set :views, "app/views"
      set :static_cache_control, [:public, { max_age: (60 * 60) }]
      set :default_content_type, :json

      enable :logging, :method_override, :static
      disable :dump_errors

      configure :development do
        register Sinatra::Reloader
        after_reload do
          puts "reloaded"
        end
      end

      configure :test do
        set :show_exceptions, :after_handler
      end

      helpers Helpers
    end
  end
end
