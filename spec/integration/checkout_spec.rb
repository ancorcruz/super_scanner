require 'spec_helper'

RSpec.describe 'Super Scanner Checkout' do
  let(:checkout) { SuperScanner::Checkout.new(pricing_rules) }

  let(:discount_A) { SuperScanner::PricingRule::VolumeDiscount.new(3, 20) }
  let(:discount_B) { SuperScanner::PricingRule::VolumeDiscount.new(2, 15) }
  let(:pricing_rules) {
    {
      'A' => SuperScanner::PricingRule.new(50, special_price: discount_A),
      'B' => SuperScanner::PricingRule.new(30, special_price: discount_B),
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

  context 'when the basket has discounts' do
    before do
      checkout.scan('B')
      checkout.scan('A')
      checkout.scan('B')
    end

    it { expect(checkout.total).to eql 95 }
  end
end
