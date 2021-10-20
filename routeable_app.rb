class RouteableApp
  @@routes ||= []

  def routes
    @@routes
  end

  def self.each(&block)
    @@routes.each &block
  end

  def self.route(route)
    @@routes << route
  end
end

