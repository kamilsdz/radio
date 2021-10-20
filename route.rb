class Route
  attr_reader :to
  def initialize(path:, method:, to:)
    @path = path
    @method = method
    @to = to
  end

  def having_path?(other_path)
    path == other_path
  end

  def having_method?(other_method)
    method == other_method
  end

  private

  attr_reader :path, :method
end
