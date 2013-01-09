require 'rubygems'
require 'bundler'

Bundler.require :default, :test

require_relative 'playa'

Shoes.app do
  title "OpenPlay"

  flow do
    stack do
      draw_hosts = proc do
        hosts = ::Openplay::Client.new.list.map(&:hosttxt)
        hosts.each do |host|
          button host do
            Playa.play(host)
          end
        end
      end

      para 'Pick a screen to throw up on...'
      @hostlist = flow {
        draw_hosts.call
      }
      button "Refresh" do
        @hostlist.clear do
          draw_hosts.call
        end
      end
    end

    stack do
      para "...or say you'll receive some video..."
      button "Receive" do
        Playa.front
      end
    end
  end
end
