class HitbtcImporter
  include HTTParty
  base_uri 'https://api.hitbtc.com/api/2/public'

  def import_symbols
    symbols = get_response_body 'symbol'
    numbers_of_created_pairs = 0
    symbols.each do |symbol|
      base_currency = Currency.find_by title: symbol['baseCurrency']
      quote_currency = Currency.find_by title: symbol['quoteCurrency']
      if base_currency.present? and quote_currency.present?
        pair = Pair.create(
          base_currency: base_currency,
          quote_currency: quote_currency,
          title: symbol['id']
        )
        numbers_of_created_pairs += 1 if pair.errors.empty?
      end
    end
    numbers_of_created_pairs
  end

  def import_tickers
    Pair.all.each do |pair|
      ticker = get_response_body "ticker/#{pair.title}"
      permit_keys = ['bid', 'timestamp', 'open', 'low', 'high', 'volume']
      pair.tickers.create ticker.slice(*permit_keys)
    end
  end

  private

  def get_response_body(method)
    response = self.class.get("/#{method}")
    JSON.parse(response.body)
  end

end
