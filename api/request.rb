module Api
  class Request
    def initialize(data)
      @data = data.split("\r\n")[0].split
    end

    def method
      data[0].downcase.to_sym
    end

    def path
      data[1]
    end

    private

    attr_reader :data
  end
end
