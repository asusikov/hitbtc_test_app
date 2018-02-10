class PairsController < ApplicationController
  def show
    @pair = Pair.find params[:id]
  end

  def index
    @pairs = Pair.all.includes(:last_ticker, :base_currency, :quote_currency)
  end
end
