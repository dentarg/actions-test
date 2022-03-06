require "uri"

class Tut
  def initialize(uri)
    @uri = URI.parse(uri)
    @tls = @uri.scheme == "amqps"
    @port = amqp_port_from_env or @uri.port or @tls ? 5671 : 5672

    puts "      RUBY_VERSION: #{RUBY_VERSION}"
    puts "               uri: #{uri.inspect}"
    puts "              @tls: #{@tls.inspect}"
    puts "              @uri: #{@uri.inspect}"
    puts "             @port: #{@port.inspect}"
    puts "amqp_port_from_env: #{amqp_port_from_env.inspect}"
    puts "       @uri.scheme: #{@uri.scheme.inspect}"
    puts "         @uri.port: #{@uri.port.inspect}"
    puts
  end


  def amqp_port_from_env
    port = ENV["AMQP_PORT"]

    port.nil? ? nil : port.to_i
  end
end

puts
puts 'Tut.new("amqp://localhost")'
Tut.new("amqp://localhost")

puts
puts 'Tut.new("amqps://localhost")'
Tut.new("amqps://localhost")
