# frozen_string_literal: true

module SolanaSdk
  module JsonRpc
    class Error
      attr_reader :code, :data, :message
    
      def self.initialize_from(error)
        new(code: error["code"], data: error["data"], message: error["message"])
      end
    
      def initialize(code:, data:, message:)
        @code = code
        @data = data
        @message = message
      end

      def to_h
        { code: code, data: data, message: message }
      end
      alias_method :to_hash, :to_h
    end
  end
end
