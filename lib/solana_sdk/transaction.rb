# frozen_string_literal: true

module SolanaSdk
  class Transaction
    attr_reader :instructions

    def initialize
      @instructions = []
    end

    def add_instruction(instruction)
      instructions << instruction
    end
  end
end
