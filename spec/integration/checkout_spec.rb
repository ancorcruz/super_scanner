require 'spec_helper'

RSpec.describe 'Super Scanner Checkout' do
  let(:checkout) { SuperScanner::Checkout.new(pricing_rules) }
  let(:pricing_rules) {
    {
      'A' => SuperScanner::PricingRule.new(50),
      'B' => SuperScanner::PricingRule.new(30),
      'C' => SuperScanner::PricingRule.new(20),
      'D' => SuperScanner::PricingRule.new(15),
    }
  }

  context 'with no scanned items' do
    it { expect(checkout.total).to be_zero }
  end

  context 'when the basket has no discounts' do
    before do
      checkout.scan('A')
      checkout.scan('B')
      checkout.scan('A')
      checkout.scan('D')
    end

    it { expect(checkout.total).to eql 145 }
  end
end
