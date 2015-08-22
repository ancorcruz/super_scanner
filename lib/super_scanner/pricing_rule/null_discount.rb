module SuperScanner
  class PricingRule
    class NullDiscount
      def apply_for(_)
        0
      end
    end
  end
end

