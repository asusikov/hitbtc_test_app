class LastTickerNotificator
  def self.notificate
    tickers = Pair.all.includes(:last_ticker).map do |pair|
      last_ticker = pair.last_ticker.attributes
      last_ticker['timestamp'] = last_ticker['timestamp'].strftime('%F %H:%M')
      ActionCable.server.broadcast(
        "pair_#{pair.id}_notifications_channel",
        last_ticker: last_ticker,
        rendered_ticker:  PairsController.render(
          partial: 'pairs/tickers/ticker',
          locals: { ticker: pair.last_ticker }
        )
      )
      {
        pair_id: pair.id,
        bid: pair.last_ticker.bid
      }
    end
    ActionCable.server.broadcast(
      'tickers_notifications_channel',
      tickers: tickers)
  end
end
