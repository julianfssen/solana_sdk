# frozen_string_literal: true

require_relative "./error"

module SolanaSdk
  module JsonRpc
    class Response
      RPC_VERSION = "2.0"

      attr_reader :error, :id, :result

      def self.initialize_from(response)
        new(error: response["error"], id: response["id"], result: response["result"])
      end

      def initialize(error:, id:, result:)
        @error = error ? JsonRpc::Error.initialize_from(error) : nil
        @id = id
        @result = result
      end

      def to_h
        base = { jsonrpc: RPC_VERSION, id: id }

        if error?
          base[:error] = error.to_h
        else
          base[:result] = result
        end

        base
      end
      alias_method :to_hash, :to_h

      def error?
        !error.nil?
      end
    end
  end
end
