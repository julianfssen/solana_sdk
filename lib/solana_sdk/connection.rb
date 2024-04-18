# frozen_string_literal: true

require "net/http"
require "uri"
require_relative "./connection/rpc_methods"

module SolanaSdk
  class Connection
    include RpcMethods

    DEVNET_URL = "https://api.devnet.solana.com"
    TESTNET_URL = "https://api.testnet.solana.com"

    attr_reader :base_uri

    def initialize(endpoint: "", devnet: false, testnet: false)
      if devnet
        @base_uri = URI(DEVNET_URL)
      elsif testnet
        @base_uri = URI(TESTNET_URL)
      else
        raise ArgumentError.new("Endpoint URL must start with 'http://' or 'https://'.") if !valid_endpoint?(endpoint)
        @base_uri = URI(endpoint)
      end
    end

    def cluster_url
      base_uri.to_s
    end
    alias_method :endpoint, :cluster_url

    def devnet?
      cluster_url == DEVNET_URL
    end

    def testnet?
      cluster_url == TESTNET_URL
    end
  
    private

    def valid_endpoint?(endpoint)
      endpoint && (endpoint.start_with?("http://") || endpoint.start_with?("https://"))
    end
  
    def post(data)
      Net::HTTP.post(base_uri, data, **headers)
    end
  
    def headers
      { "Content-Type" => "application/json" }
    end
  end
end
