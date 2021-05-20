require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#index" do
    let!(:user) { create(:user) }
    let!(:users) { create_list(:user, 5) }

    it 'redirect to login page if not signed' do
      get :index
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to new_user_session_path
    end

    it "load index page" do
      sign_in user

      get :index
      expect(assigns(:users)).to be_present
      expect(assigns(:users).count).to be(6)
      expect(response).to have_http_status(:ok)
      expect(response).to render_template :index
    end
  end

  describe "#show" do
    let!(:user) { create(:user) }
    
    it 'redirect to login page if not signed' do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to new_user_session_path
    end

    it "load show page" do
      sign_in user

      get :show, params: { id: user.id }
      expect(assigns(:user)).to be_present
      expect(response).to have_http_status(:ok)
      expect(response).to render_template :show
    end
  end
end
