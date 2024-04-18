# frozen_string_literal: true

require "json"

module SolanaSdk
  module JsonRpc
    class Request
      RPC_VERSION = "2.0"

      attr_reader :method, :id, :params

      def initialize(method:, id:, params:)
        @method = method
        @id = id
        @params = params
      end

      def to_h
        { jsonrpc: RPC_VERSION, method: method, params: params, id: id }.compact
      end
      alias_method :to_hash, :to_h

      def to_json
        to_h.to_json
      end
    end
  end
end
