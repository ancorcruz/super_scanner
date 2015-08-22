require 'spec_helper'

module SuperScanner
  RSpec.describe PricingRule do
    let(:pricing_rule) { PricingRule.new(15) }

    describe '#price_for' do
      it { expect(pricing_rule.price_for(1)).to eql 15 }
      it { expect(pricing_rule.price_for(2)).to eql 30 }
      it { expect(pricing_rule.price_for(10)).to eql 150 }

      context 'when a special price is specified' do
        let(:pricing_rule) { PricingRule.new(15, special_price: discount) }
        let(:discount)     { double(:discount) }

        before do
          allow(discount).to receive(:apply_for).with(1).and_return(0)
          allow(discount).to receive(:apply_for).with(2).and_return(-5)
          allow(discount).to receive(:apply_for).with(5).and_return(-10)
        end

        it { expect(pricing_rule.price_for(1)).to eql 15 }
        it { expect(pricing_rule.price_for(2)).to eql 25 }
        it { expect(pricing_rule.price_for(5)).to eql 65 }
      end
    end
  end
end
