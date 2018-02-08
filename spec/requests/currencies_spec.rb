require 'rails_helper'

RSpec.describe "Currencies", type: :request do
  describe "GET /currencies" do
    it "should renders list of currency" do
      create_list :currency, 4
      get currencies_path
      assert_select '.card', 4
    end
    it 'should display last ticker of currency pair' do
      currency = create :currency
      pair = create(:pair, base_currency: currency, quote_currency: currency)
      create :ticker, bid: 8428.33, pair: pair
      get currencies_path
      assert_select '.ticker', '8428.33 BTC'
    end
  end
end
