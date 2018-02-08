class CreateTickers < ActiveRecord::Migration[5.0]
  def change
    create_table :tickers do |t|
      t.decimal :bid
      t.references :pair, foreign_key: true
      t.datetime :timestamp

      t.timestamps
    end
  end
end
