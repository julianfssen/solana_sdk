# frozen_string_literal: true

module SolanaSdk
  class Utils
    LAMPORTS_PER_SOL = 1_000_000_000

    class << self
      def lamports_to_sol(lamports)
        lamports.to_f / LAMPORTS_PER_SOL
      end
    end
  end
end
