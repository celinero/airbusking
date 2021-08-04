require "rails_helper"

RSpec.describe BuskerProfilesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/busker_profiles").to route_to("busker_profiles#index")
    end

    it "routes to #new" do
      expect(get: "/busker_profiles/new").to route_to("busker_profiles#new")
    end

    it "routes to #show" do
      expect(get: "/busker_profiles/1").to route_to("busker_profiles#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/busker_profiles/1/edit").to route_to("busker_profiles#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/busker_profiles").to route_to("busker_profiles#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/busker_profiles/1").to route_to("busker_profiles#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/busker_profiles/1").to route_to("busker_profiles#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/busker_profiles/1").to route_to("busker_profiles#destroy", id: "1")
    end
  end
end
