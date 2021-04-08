require "rails_helper"

RSpec.describe PetsController, type: :routing do
  describe "routing devise" do
    it { expect(get: "/login").to route_to("devise/sessions#new") }

    it { expect(post: "/login").to route_to("devise/sessions#create") }
    
    it { expect(delete: "/logout").to route_to("devise/sessions#destroy") }

    it { expect(get: "/signup/sign_up").to route_to("devise/registrations#new") }

    it { expect(post: "/signup").to route_to("devise/registrations#create") }
  end

  describe "routing users" do
    it { expect(get: "/users").to route_to("users#index") }

    it { expect(get: "/users/1").to route_to("users#show", id: "1") }
  end
end