FactoryBot.define do
  factory :pair do
    association :base_currency, factory: :currency
    association :quote_currency, factory: :currency

    title 'USDBTC'    
  end
end
