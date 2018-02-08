class Currency < ApplicationRecord
  has_many :pairs, foreign_key: :base_currency_id
end
