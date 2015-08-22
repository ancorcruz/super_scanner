require 'spec_helper'

module SuperScanner
  RSpec.describe PricingRule do
    let(:pricing_rule) { PricingRule.new(15) }

    describe '#price_for' do
      it { expect(pricing_rule.price_for(1)).to eql 15 }
      it { expect(pricing_rule.price_for(2)).to eql 30 }
      it { expect(pricing_rule.price_for(10)).to eql 150 }
    end
  end
end
