require 'spec_helper'

RSpec.describe Checkout do
  let(:checkout) { Checkout.new(pricing_rules) }
  let(:pricing_rules) { Hash.new }

  describe '#total' do
    subject { checkout.total }

    context 'with no scanned items' do
      it { is_expected.to be_zero }
    end
  end
end
