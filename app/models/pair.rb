class Pair < ApplicationRecord
  belongs_to :base_currency, class_name: 'Currency'
  belongs_to :quote_currency, class_name: 'Currency'
  has_one :last_ticker, -> { order(timestamp: :desc) }, class_name: 'Ticker'
end
