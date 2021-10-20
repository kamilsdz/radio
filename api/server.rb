require "socket"
require_relative "request"

module Api
  class Server
    def initialize(port:, routing:)
      @port = port
      @routing = routing
    end

    def run
      server = TCPServer.new(port)

      while session = server.accept
        begin
          if process_request(session.recv(5000))
            respond_ok(session)
          else
            respond_with_error(session)
          end
        rescue Errno::EPIPE
        ensure
          session.close
        end
      end
    end

    private

    attr_reader :port, :routing

    def process_request(raw_request)
      return false if raw_request.empty?

      request = Request.new(raw_request)

      route = routing.match(request)
      return false if route.nil?

      route.to.call
      true
    end

    def respond_ok(session)
      session.print "HTTP/1.1 200\r\n"
      session.print "Content-Type: text/html\r\n"
      session.print "\r\n"
      session.print "OK"
    end

    def respond_with_error(session)
      session.print "HTTP/1.1 422\r\n"
      session.print "Content-Type: text/html\r\n"
      session.print "\r\n"
      session.print "Unable to process command"
    end
  end
end
