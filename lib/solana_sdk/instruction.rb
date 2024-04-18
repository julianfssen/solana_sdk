# frozen_string_literal: true

module SolanaSdk
  class Instruction
    attr_reader :accounts, :data, :program_id

    def initialize(program_id: nil)
      @accounts = []
      @data = IO::Buffer.new
      @program_id = program_id
    end
  end

  class Account
    attr_reader :public_key, :signer, :writable

    def initialize(public_key:, signer:, writable:)
      @public_key = public_key
      @signer = signer
      @writable = writable
    end
  end
end
