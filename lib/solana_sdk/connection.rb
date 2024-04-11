class Connection
  attr_reader :endpoint

  def initialize(endpoint:)
    @endpoint = endpoint
  end
end
