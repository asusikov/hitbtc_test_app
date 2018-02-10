class AddLowHighOpenVolumeToTickers < ActiveRecord::Migration[5.0]
  def change
    add_column :tickers, :low, :decimal
    add_column :tickers, :high, :decimal
    add_column :tickers, :open, :decimal
    add_column :tickers, :volume, :decimal
  end
end
