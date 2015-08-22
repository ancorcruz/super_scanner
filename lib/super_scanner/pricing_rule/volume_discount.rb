module SuperScanner
  class PricingRule
    class VolumeDiscount
      def initialize(volume, discount)
        @volume, @discount = volume, discount
      end

      def apply_for(amount)
        (amount / @volume) * -@discount
      end
    end
  end
end
