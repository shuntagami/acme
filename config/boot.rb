require "bundler"

Bundler.require(:default, ENV["RACK_ENV"] || "development")

Dir.glob("config/initializers/*.rb").each { |file| require file }

Dir.glob("app/**/*.rb").each do |file|
  require file unless Dir.entries("app/routes").include?(File.basename(file))
end

require "app/routes/base"
Dir.glob("app/routes/*.rb").each { |file| require file }

Dir.glob("app/models/*.rb").each { |file| require file }

require "config/middleware"
require "config/routes"

require "application"
