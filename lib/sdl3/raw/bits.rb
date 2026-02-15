# frozen_string_literal: true

module SDL3
  module Raw
    module Bits
      def self.most_significant_bit_index32(x)
        return -1 if x == 0

        31 - x.to_s(2).rjust(32, "0").index("1")
      end

      def self.has_exactly_one_bit_set32(x)
        x != 0 && (x & (x - 1)) == 0
      end
    end
  end
end
