# frozen_string_literal: true

module SolanaSdk
  class Keypair
    attr_reader :public_key, :private_key

    def self.generate
      keypair = new
      keypair.public_key = nil
      keypair.private_key = nil
      keypair
    end
  end
end
