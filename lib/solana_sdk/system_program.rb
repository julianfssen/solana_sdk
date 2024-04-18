# frozen_string_literal: true

module SolanaSdk
  class SystemProgram
    class << self
      ID = 11111111111111111111111111111111

      def transfer(from:, to:, lamports:)
        accounts = [
          Account.new(public_key: from, signer: true, writable: true),
          Account.new(public_key: to, signer: false, writable: true)
        ]

        data = IO::Buffer.new(8)
        data.set_value(:u64, 0, lamports)

        Instruction.new(accounts: accounts, data: data, program_id: ID)
      end
    end
  end
end
