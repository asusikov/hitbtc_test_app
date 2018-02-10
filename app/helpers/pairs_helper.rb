module PairsHelper
  def get_full_title_of_pair(pair)
    "#{pair.base_currency.title} - #{pair.quote_currency.title}"
  end
end
