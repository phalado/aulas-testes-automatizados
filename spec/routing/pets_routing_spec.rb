require "rails_helper"

RSpec.describe PetsController, type: :routing do
  describe "routing pets" do
    it { expect(get: "/pets").to route_to("pets#index") }

    it { expect(get: "/pets/new").to route_to("pets#new") }

    it { expect(get: "/pets/1").to route_to("pets#show", id: "1") }

    it { expect(get: "/pets/1/edit").to route_to("pets#edit", id: "1") }

    it { expect(post: "/pets").to route_to("pets#create") }

    it { expect(put: "/pets/1").to route_to("pets#update", id: "1") }

    it { expect(patch: "/pets/1").to route_to("pets#update", id: "1") }

    it { expect(delete: "/pets/1").to route_to("pets#destroy", id: "1") }
  end
end
