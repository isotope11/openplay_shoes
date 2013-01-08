require 'rubygems'
require 'bundler'

Bundler.require :default, :test

require_relative 'playa'

Shoes.app do
  hosts = ['127.0.0.1']
  para 'Welcome to OpenPlay.  Pick a screen to throw up on.'
  hosts.each do |host|
    button host do
      Playa.play(host)
    end
  end
  para "...or say you'll receive some video..."
  button "Receive" do
    Playa.front
  end
end
