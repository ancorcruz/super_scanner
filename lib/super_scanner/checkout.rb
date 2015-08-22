module SuperScanner
  class Checkout
    def initialize(pricing_rules)
      @pricing_rules = pricing_rules
      @scanned_items = Hash.new(0)
    end

    def total
      scanned_items.inject(0) do |total, (item, amount)|
        total += price_for(item, amount)
      end
    end

    def scan(item)
      scanned_items[item] += 1
    end

    private

    attr_reader :pricing_rules, :scanned_items

    def price_for(item, amount)
      pricing_rules.fetch(item).price_for(amount)
    end
  end
end
