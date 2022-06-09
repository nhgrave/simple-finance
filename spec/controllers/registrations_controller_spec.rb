require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  describe 'registrations#new' do
    context "should have route registrations#new" do
      it {
        expect(get: "/registration/new").to route_to(
          controller: "registrations",
          action: "new"
        )
      }
    end
  end

  describe 'registrations#create' do
    context "should have route registrations#create" do
      it {
        expect(post: "/registration").to route_to(
          controller: "registrations",
          action: "create"
        )
      }
    end
  end
end
