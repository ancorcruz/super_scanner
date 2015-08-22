require 'spec_helper'

RSpec.describe 'Super Scanner Checkout' do
  let(:checkout) { Checkout.new(pricing_rules) }
  let(:pricing_rules) { Hash.new }

  context 'with no scanned items' do
    it { expect(checkout.total).to be_zero }
  end
end
