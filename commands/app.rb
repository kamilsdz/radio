require_relative "start"
require_relative "stop"

module Commands
  class App
    class << self
      def start
        Commands::Start.new
      end

      def stop
        Commands::Stop.new
      end
    end
  end
end
