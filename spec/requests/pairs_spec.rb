require 'rails_helper'

RSpec.describe "Pairs", type: :request do
  describe 'GET /pairs' do
    it 'should display list of pairs' do
      pairs = create_list :pair, 3
      pairs.each { |pair| create :ticker, pair: pair }
      get pairs_path
      assert_select '.card', 3
    end
  end
  describe "GET /pairs/:id" do
    it "should display info about pair" do
      base_currency = create :currency
      quote_currency = create :currency, title: 'USD'
      pair = create :pair, base_currency: base_currency, quote_currency: quote_currency
      create :ticker, pair: pair
      get pair_path(pair.id)
      assert_select '.card-title', /BTC - USD/
    end
  end
  describe "GET /pairs/:id/tickers" do
    it "should display list of tickers" do
      pair = create :pair
      create_list :ticker, 7, pair: pair
      get tickers_pair_path(pair)
      assert_select '.card', 7
    end
  end
end
