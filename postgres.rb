$stdout.sync = true
$stderr.sync = true

require "sequel"

url = if ENV.has_key?("POSTGRES_URL")
        ENV.fetch("POSTGRES_URL")
      else
        user = "postgres"
        pass = "postgres"
        host = ENV.fetch("POSTGRES_HOST")
        port = ENV.fetch("POSTGRES_PORT")
        db   = "postgres"
        "postgres://#{user}:#{pass}@#{host}:#{port}/#{db}"
      end

Sequel.connect(url)
