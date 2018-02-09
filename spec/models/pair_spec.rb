require 'rails_helper'

RSpec.describe Pair, type: :model do
  describe '#last_ticker' do
    let(:pair) { create :pair }
    let!(:ticker) { create :ticker, pair: pair, timestamp: DateTime.now.beginning_of_day }
    let!(:last_ticker) { create :ticker, pair: pair, timestamp: DateTime.now }
    subject { pair.last_ticker }
    it { is_expected.to eq(last_ticker) }
  end

end
