class Playa
  include Celluloid
  def initialize
  end

  def self.play(host)
    new.async.play(host)
  end

  def self.front
    new.async.front
  end

  def play(hostname)
    client = ::Openplay::Client.new(hostname: hostname)
    client.throw
  end

  def front
    server = ::Openplay::Server.new
    server.receive
  end
end
