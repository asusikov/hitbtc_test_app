class HitbtcImporter
  include HTTParty
  base_uri 'https://api.hitbtc.com/api/2/public'

  def import_symbols
    symbols = get_response_body 'symbol'
    symbols.each do |symbol|
      base_currency = Currency.find_by title: symbol['baseCurrency']
      quote_currency = Currency.find_by title: symbol['quoteCurrency']
      Pair.create(
        base_currency: base_currency,
        quote_currency: quote_currency,
        title: symbol['id']
      ) \
        if base_currency.present? and quote_currency.present?
    end
  end

  def import_tickers
    Pair.all.each do |pair|
      puts "Pair #{pair.title}"
      ticker = get_response_body "ticker/#{pair.title}"
      pair.tickers.create bid: ticker['bid'], timestamp: ticker['timestamp']
    end
  end

  private

  def get_response_body(method)
    response = self.class.get("/#{method}")
    JSON.parse(response.body)
  end

end
