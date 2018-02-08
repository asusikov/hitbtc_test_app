class AddFullNameToCurrency < ActiveRecord::Migration[5.0]
  def change
    add_column :currencies, :full_name, :string
  end
end
