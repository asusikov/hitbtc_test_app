require 'rails_helper'

RSpec.describe "Currencies", type: :request do
  describe "GET /currencies" do
    it "should renders list of currency" do
      create_list :currency, 4

      get currencies_path

      assert_select '.card', 4
    end
  end
end
