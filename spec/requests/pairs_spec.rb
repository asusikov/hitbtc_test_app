require 'rails_helper'

RSpec.describe "Pairs", type: :request do
  describe 'GET /pairs' do
    it 'should display list of pairs' do
      create_list :pair, 3
      get pairs_path
      assert_select '.card', 3
    end
  end
  describe "GET /pairs/:id" do
    it "should display info about pair" do
      base_currency = create :currency
      quote_currency = create :currency, title: 'USD'
      pair = create :pair, base_currency: base_currency, quote_currency: quote_currency
      get pair_path(pair.id)
      assert_select '.card-title', 'BTC - USD'
    end
  end
end
