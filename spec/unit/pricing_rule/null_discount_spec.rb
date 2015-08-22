require 'spec_helper'

module SuperScanner
  class PricingRule
    RSpec.describe NullDiscount do
      describe '#apply_for' do
        subject { NullDiscount.new.apply_for(10) }

        it { is_expected.to be_zero }
      end
    end
  end
end
