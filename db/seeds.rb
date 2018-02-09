# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ticker.destroy_all
Pair.destroy_all
Currency.destroy_all

btc = Currency.create! title: 'BTC', full_name: 'Bitcoin'
eth = Currency.create! title: 'ETH', full_name: 'Ethereum'
xrp = Currency.create! title: 'XRP', full_name: 'Ripple'
Currency.create! title: 'LTC', full_name: 'Litecoin'
Currency.create! title: 'EOS', full_name: 'EOS'
Currency.create! title: 'BCH', full_name: 'Bitcoin Cash'
Currency.create! title: 'NEO', full_name: 'NEO'
Currency.create! title: 'ETC', full_name: 'Ethereum Classic'
Currency.create! title: 'DASH', full_name: 'Dash'
Currency.create! title: 'ZEC', full_name: 'Zcash'
Currency.create! title: 'XMR', full_name: 'Monero'
Currency.create! title: 'OMG', full_name: 'OmiseGO'
Currency.create! title: 'BTG', full_name: 'Bitcoin Gold'
Currency.create! title: 'SAN', full_name: 'Santiment'
Currency.create! title: 'TRX', full_name: 'TRON'
usd = Currency.create! title: 'USD', full_name: 'USD'


HitbtcImporter.new.import_symbols
