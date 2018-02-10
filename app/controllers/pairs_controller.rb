class PairsController < ApplicationController

  before_action :find_pair, only: [:show, :tickers]

  def show
  end

  def index
    @pairs = Pair.all.includes(:last_ticker, :base_currency, :quote_currency)
  end

  def tickers
    @tickers = @pair.tickers.order(timestamp: :desc)
    @timestamps = @tickers.map { |ticker| ticker.timestamp.strftime('%F %H:%M') }
    @bids = @tickers.map { |ticker| ticker.bid }
  end

  private

  def find_pair
    @pair = Pair.find params[:id]
  end
end
