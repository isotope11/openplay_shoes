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

  def play(host)
    client = ::Openplay::Client.new(host)
    client.throw
  end

  def front
    server = ::Openplay::Server.new
    server.receive
  end
end
