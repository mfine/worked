require "json"
require "securerandom"
require "press"
require "unicorn"
require "queue_classic"
require "worked/error"
require "worked/conf"
require "worked/endpoints/api"

module Worked
  module Tasks
    module Api
      extend Press

      def self.server
        @server ||= Unicorn::HttpServer.new(Endpoints::Api, listeners: ["0.0.0.0:#{Conf.port}"])
      end

      def self.run
        ctx app: Conf.app_name, task: "api"
        pdfm __FILE__, __method__
        server.start.join
      rescue => e
        pdfme __FILE__, __method__, e
        exit 1
      end
    end
  end
end
