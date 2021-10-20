#require "commands"
require_relative "api/app"
require_relative "commands/app"
require_relative "route"
require_relative "routeable_app"

class App < RouteableApp
  route Route.new(path: "/start", method: :post, to: Commands::App.start)
  route Route.new(path: "/stop", method: :post, to: Commands::App.stop)

  def run
    api = Api::App.new(port: 2000, routes: routes)
    api.run
  end
end
