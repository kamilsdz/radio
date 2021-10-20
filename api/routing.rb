module Api
  class Routing
    def initialize
      @routes = []
    end

    def self.build(routes)
      routing = new
      routes.each { |route| routing.add(route) }

      routing
    end

    def add(route)
      raise ArgumentError unless route.is_a?(Route)

      routes << route
    end

    def match(request)
      routes.detect do |route|
        route.having_path?(request.path) && route.having_method?(request.method)
      end
    end

    private

    attr_reader :routes
  end
end
