require 'rubygems'
require 'bundler'

Bundler.require :default, :test

require_relative 'playa'

module OpenplayDrawing
  def draw_hosts
    hosts = ::Openplay::Client.new.list.map(&:hosttxt)
    hosts.each do |host|
      button host do
        Playa.play(host)
      end
    end
  end
end

Shoes.app do
  extend OpenplayDrawing

  title "OpenPlay"

  flow do
    flow(width: 0.5) do
      para 'Pick a screen to throw up on...'
      @hostlist = flow { draw_hosts }
      button "Refresh" do
        @hostlist.clear do
          draw_hosts
        end
      end
    end

    flow(width: 0.5) do
      para "...or say you'll receive some video..."
      button "Receive" do
        Playa.front
      end
    end
  end
end
