require "sinatra"
require "queue_classic"

module Worked
  module Endpoints
    class Api < Sinatra::Base
      extend Press

      disable :show_exceptions, :dump_errors

      helpers do
        def data
          @data ||= JSON.parse(request.body.read) rescue {}
        end
      end

      before do
        content_type :json
      end

      post "/work" do
        self.class.pdfm __FILE__, __method__, data
        QC.enqueue("Worked::Work.run", data)
        status 200
      end

      not_found do
        status 404
        content_type :json
        ""
      end

      error do
        status 500
        content_type :json
        self.class.pde env['sinatra.error']
        ""
      end
    end
  end
end
