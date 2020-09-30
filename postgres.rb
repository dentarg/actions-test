$stdout.sync = true
$stderr.sync = true

require "sequel"

url = if ENV.has_key?("POSTGRES_URL")
        ENV.fetch("POSTGRES_URL")
      else
        user = ENV.fetch("POSTGRES_USER", "postgres")
        pass = ENV.fetch("POSTGRES_PASS", "postgres")
        host = ENV.fetch("POSTGRES_HOST")
        port = ENV.fetch("POSTGRES_PORT", 5432)
        db   = ENV.fetch("POSTGRES_DB", "postgres")

        "postgres://#{user}:#{pass}@#{host}:#{port}/#{db}"
      end

DB = Sequel.connect(url)

# test
DB.run('CREATE EXTENSION IF NOT EXISTS "uuid-ossp"')

DB.create_table :items do
  primary_key :id
  column :uuid, :uuid, default: Sequel.function(:uuid_generate_v4)
  String :name
  Float :price
end

items = DB[:items] # Create a dataset

# Populate the table
items.insert(:name => 'abc', :price => rand * 100)
items.insert(:name => 'def', :price => rand * 100)
items.insert(:name => 'ghi', :price => rand * 100)

# Print out the number of records
puts "Item count: #{items.count}"

# Print out the average price
puts "The average price is: #{items.avg(:price)}"
