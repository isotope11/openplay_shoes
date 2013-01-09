require 'rubygems'
require 'bundler'

Bundler.require :default, :test

require_relative 'playa'

Shoes.app do
  hosts = ::Openplay::Client.new.list.map(&:hosttxt)
  para 'Welcome to OpenPlay.  Pick a screen to throw up on.'
  hosts.each do |host|
    flow do
      button host do
        Playa.play(host)
      end
    end
  end
  para "...or say you'll receive some video..."
  button "Receive" do
    Playa.front
  end
end
