# frozen_string_literal: true

require_relative "./version"

class JsonRpc::Request
  include Version

  attr_reader :method, :id, :params

  def initialize(method:, :id, params:)
    @method = method
    @id = id
    @params = params
  end

  def to_h
    {
      jsonrpc: VERSION,
      method: method,
      params: params,
      id: id
    }
  end
  alias_method :to_hash, :to_h
end
