require 'spec_helper'

module SuperScanner
  RSpec.describe Checkout do
    let(:checkout)       { Checkout.new(pricing_rules) }

    let(:pricing_rule_A) { double(:pricing_rule) }
    let(:pricing_rule_B) { double(:pricing_rile) }
    let(:pricing_rules)  {
      {
        'A' => pricing_rule_A,
        'B' => pricing_rule_B,
      }
    }

    describe '#total' do
      subject { checkout.total }

      context 'with no scanned items' do
        it { is_expected.to be_zero }
      end

      context 'with scanned items' do
        before do
          allow(pricing_rule_A).to receive(:price_for).with(2).and_return(100)
          allow(pricing_rule_B).to receive(:price_for).with(1).and_return(30)

          checkout.scan('A')
          checkout.scan('B')
          checkout.scan('A')
        end

        it { is_expected.to eql 130 }
      end

      context 'when a scanned item has no pricing rule' do
        let(:message) { 'Pricing rule not found for "W"' }

        before do
          checkout.scan('W')
        end

        it { expect { subject }.to raise_error(Checkout::PricingRuleNotFound, message) }
      end
    end

    describe '#scan' do
      it 'receives an item id' do
        expect(checkout.scan('A')).to_not be_nil
      end
    end
  end
end
