$stdout.sync = true
$stderr.sync = true

require "sequel"

user = "postgres"
pass = "postgres"
host = ENV.fetch("POSTGRES_HOST")
port = ENV.fetch("POSTGRES_PORT")
db   = "postgres"

url = "postgres://#{user}:#{pass}@#{host}:#{port}/#{db}"

Sequel.connect(url)
