require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'sessions#new' do
    context "should have route sessions#new" do
      it {
        expect(get: "/session/new").to route_to(
          controller: "sessions",
          action: "new"
        )
      }
    end
  end

  describe 'sessions#create' do
    context "should have route sessions#create" do
      it {
        expect(post: "/session").to route_to(
          controller: "sessions",
          action: "create"
        )
      }
    end
  end

  describe 'sessions#desroy' do
    context "should have route sessions#destroy" do
      it {
        expect(delete: "/session").to route_to(
          controller: "sessions",
          action: "destroy"
        )
      }
    end
  end
end
