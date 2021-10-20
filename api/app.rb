require_relative "routing"
require_relative "server"

module Api
  class App
    def initialize(port:, routes:)
      @port = port
      @routing = Api::Routing.build(routes)
    end

    def run
      server = Server.new(port: port, routing: routing)
      server.run
    end

    private

    attr_reader :port, :routing
  end
end
