workers ENV.fetch("SERVER_WORKER_COUNT", 2)

max_threads_count = ENV.fetch("SERVER_MAT_THREADS_COUNT", 5)
min_threads_count = ENV.fetch("SERVER_MIN_THREADS_COUNT", max_threads_count)
threads min_threads_count, max_threads_count

preload_app!

environment ENV.fetch("RACK_ENV", "development")
pidfile ENV.fetch("PIDFILE", "tmp/pids/server.pid")

on_worker_boot do
  ActiveRecord::Base.configurations = YAML.load_file("config/database.yml")
  ActiveRecord::Base.establish_connection
end
