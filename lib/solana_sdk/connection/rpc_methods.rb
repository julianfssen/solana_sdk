# frozen_string_literal: true

require_relative "../json_rpc/request"
require_relative "../json_rpc/response"

module SolanaSdk
  class Connection
    module RpcMethods
      def health
        request(method: "getHealth", id: 1)
      end

      def balance(address, **args)
        if args.empty?
          request(method: "getBalance", id: 1, params: [address])
        else
          request(method: "getBalance", id: 1, params: [address, args])
        end
      end

      private

      def request(method:, id:, params:)
        req = JsonRpc::Request.new(method: method, id: id, params: params)
        res = post(req.to_json)
        data = JSON.parse(res.body)
        JsonRpc::Response.initialize_from(data)
      end
    end
  end
end
