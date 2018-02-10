require 'rails_helper'

RSpec.describe PairsController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      pair = create :pair
      get :show, id: pair.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #tickers" do
    it "returns http success" do
      pair = create :pair
      get :tickers, id: pair.id
      expect(response).to have_http_status(:success)
    end
  end

end
