class CreatePairs < ActiveRecord::Migration[5.0]
  def change
    create_table :pairs do |t|
      t.references :base_currency, references: :currencies
      t.references :quote_currency, references: :currencies
      t.string :title, unique: true

      t.timestamps
    end

    add_foreign_key :pairs, :currencies, column: :base_currency_id
    add_foreign_key :pairs, :currencies, column: :quote_currency_id
  end
end
