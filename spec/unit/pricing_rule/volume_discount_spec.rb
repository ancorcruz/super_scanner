require 'spec_helper'

module SuperScanner
  class PricingRule
    RSpec.describe VolumeDiscount do
      let(:volume_discount) { VolumeDiscount.new(3, 20) }

      describe '#apply_for' do
        it { expect(volume_discount.apply_for(1)).to be_zero }
        it { expect(volume_discount.apply_for(2)).to be_zero }
        it { expect(volume_discount.apply_for(3)).to eql(-20) }
        it { expect(volume_discount.apply_for(5)).to eql(-20) }
        it { expect(volume_discount.apply_for(10)).to eql(-60) }
      end
    end
  end
end
