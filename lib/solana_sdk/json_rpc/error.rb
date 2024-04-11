# frozen_string_literal: true

require_relative "./version"

class JsonRpc::Error
  include Version

  STATUS = {
  }

  attr_reader :code, :data, :message

  def self.initialize_from(error)
    new(code: error["code"], data: error["data"], message: error["message"])
  end

  def initialize(code:, data:, message:)
    @code = code
    @data = data
    @message = message
  end
end
