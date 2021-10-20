#require "commands"
require_relative "api/app"
require_relative "route"
require_relative "routeable_app"

class App < RouteableApp
  route Route.new(path: "/start", method: :post, to: "Commands::Start")
  route Route.new(path: "/stop", method: :post, to: "Commands::Stop")

  def run
    api = Api::App.new(port: 2000, routes: routes)
    api.run
  end
end
