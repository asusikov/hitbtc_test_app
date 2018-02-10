class PairsController < ApplicationController
  def show
    @pair = Pair.find params[:id]
  end

  def index
    @pairs = Pair.all.includes(:last_ticker, :base_currency, :quote_currency)
  end

  def tickers
    @pair = Pair.find params[:id]
    @tickers = @pair.tickers
  end
end
