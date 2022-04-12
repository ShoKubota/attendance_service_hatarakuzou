require 'rails_helper'

RSpec.describe "Admin::Attendances", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admin/attendances/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /approve" do
    it "returns http success" do
      get "/admin/attendances/approve"
      expect(response).to have_http_status(:success)
    end
  end

end
