require 'rails_helper'

RSpec.describe 'HitbtcImporter' do
  describe '#import_symbols' do
    let!(:currencies) { [create(:currency, title: 'BTC'), create(:currency, title: 'USD')] }
    let(:base_currency) { 'BTC' }
    let(:quote_currency) { 'USD' }
    let(:json_data) do
      [{
        "id": "#{base_currency}#{quote_currency}",
        "baseCurrency": base_currency,
        "quoteCurrency": quote_currency
      }]
    end
    let(:response) { double('Response', :success? => true, :body => json_data.to_json) }
    before(:each) { HitbtcImporter.stub(:get).and_return(response) }
    subject { HitbtcImporter.new.import_symbols }
    it { is_expected.to eq(1) }
    context 'if base currency does not exist' do
      let(:base_currency) { 'ETH' }
      it { is_expected.to eq(0) }
    end
    context 'if quote currency does not exist' do
      let(:base_currency) { 'ETH' }
      it { is_expected.to eq(0) }
    end
  end
  describe '#import_tickers' do
    let!(:pair) { create :pair }
    let(:json_data) do
      {
        bid: 572,
        timestamp: DateTime.now,
        open: 570,
        low: 560,
        high: 583,
        volume: 10345
      }
    end
    let(:response) { double('Response', :success? => true, :body => json_data.to_json) }
    before(:each) { HitbtcImporter.stub(:get).and_return(response) }
    subject do
      HitbtcImporter.new.import_tickers
      pair.tickers.where(
        JSON.parse(json_data.to_json)
      ).count
    end
    it { is_expected.to eq(1) }
  end
end
