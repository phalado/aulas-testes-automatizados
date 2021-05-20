require 'rails_helper'

RSpec.describe PetsController, type: :controller do
  describe "#index" do
    let!(:user) { create(:user) }
    let!(:pet) { create(:pet, owner: user) }
    let!(:pets) { create_list(:pet, 5, owner: user) }

    it 'redirect to login page if not signed' do
      get :index
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to new_user_session_path
    end

    it "load index page" do
      sign_in user

      get :index
      expect(assigns(:pets)).to be_present
      expect(assigns(:pets).count).to be(6)
      expect(response).to have_http_status(:ok)
      expect(response).to render_template :index
    end
  end

  describe "#show" do
    let!(:user) { create(:user) }
    let!(:pet) { create(:pet, owner: user) }
    
    it 'redirect to login page if not signed' do
      get :show, params: { id: pet.id }
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to new_user_session_path
    end

    it "load show page" do
      sign_in user

      get :show, params: { id: pet.id }
      expect(assigns(:pet)).to be_present
      expect(response).to have_http_status(:ok)
      expect(response).to render_template :show
    end
  end

  describe "#new" do
    let!(:user) { create(:user) }
    
    it 'redirect to login page if not signed' do
      get :new
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to new_user_session_path
    end

    it "load show page" do
      sign_in user

      get :new
      expect(assigns(:pet)).to be_present
      expect(response).to have_http_status(:ok)
      expect(response).to render_template :new
    end
  end

  describe "#edit" do
    let!(:user) { create(:user) }
    let!(:pet) { create(:pet, owner: user) }
    
    it 'redirect to login page if not signed' do
      get :edit, params: { id: pet.id }
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to new_user_session_path
    end

    it "load show page" do
      sign_in user

      get :edit, params: { id: pet.id }
      expect(assigns(:pet)).to be_present
      expect(response).to have_http_status(:ok)
      expect(response).to render_template :edit
    end
  end

  describe "#create" do
    let!(:user) { create(:user) }
    
    it 'redirect to login page if not signed' do
      post :create, params: { pet: pets_create_params(user.id) }
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to new_user_session_path
    end

    it "create pet and redirect to show" do
      sign_in user

      expect do
        post :create, params: { pet: pets_create_params(user.id) }
      end.to change { Pet.count }.by(1)

      expect(assigns(:pet)).to be_present
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to pet_path(id: Pet.last.id)
    end

    it "create pet, format json" do
      sign_in user

      expect do
        post :create, params: { pet: pets_create_params(user.id) }, format: :json
      end.to change { Pet.count }.by(1)

      expect(assigns(:pet)).to be_present
      expect(response).to have_http_status(:created)
      expect(response).to render_template :show
    end

    context 'fail to create pet' do
      before(:example) do
        allow_any_instance_of(Pet).to receive(:save).and_return false
      end

      it "format html" do
        sign_in user
  
        expect do
          post :create, params: { pet: pets_create_params(user.id) }
        end.to_not change { Pet.count }
  
        expect(assigns(:pet)).to be_present
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template :new
      end

      it "format json" do
        sign_in user
  
        expect do
          post :create, params: { pet: pets_create_params(user.id) }, format: :json
        end.to_not change { Pet.count }
  
        expect(assigns(:pet)).to be_present
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "#update" do
    let!(:user) { create(:user) }
    let!(:pet) { create(:pet, owner: user) }
    let(:new_name) { Faker::Creature::Dog.name }
    
    it "update pet's name" do
      sign_in user

      expect do
        put :update, params: { id: pet.id, pet: { name: new_name } }
        pet.reload
      end.to change { pet.name }.to(new_name)
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to pet_path(id: pet.id)
    end

    context 'fail to update pet' do
      before(:example) do
        allow_any_instance_of(Pet).to receive(:update).and_return false
      end

      it "format html" do
        sign_in user
  
        expect do
          put :update, params: { id: pet.id, pet: { name: new_name } }
          pet.reload
        end.to_not change { Pet.name }
  
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template :edit
      end
    end
  end

  describe "#destroy" do
    let!(:user) { create(:user) }
    let!(:pet) { create(:pet, owner: user) }
    
    it "destroy pet" do
      sign_in user

      expect do
        delete :destroy, params: { id: pet.id }
      end.to change { Pet.count }.by(-1)
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to pets_path
    end
  end
end