class CurrenciesController < ApplicationController
  def index
    @currencies = Currency.all.includes pairs: [:last_ticker, :quote_currency]
  end
end
