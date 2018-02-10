FactoryBot.define do
  factory :ticker do
    bid "9.99"
    association :pair, factory: :pair
    timestamp "2018-02-08 20:33:08"
  end
end
