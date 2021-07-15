# frozen_string_literal: true

require "spec_helper"

module Decidim
  module UserExporter
    module Admin
      describe UserExporterController, type: :controller do
        routes { Decidim::UserExporter::AdminEngine.routes }

        let(:organization) { create(:organization) }
        let(:current_user) { create :user, :confirmed, :admin, organization: organization }

        before do
          request.env["decidim.current_organization"] = organization
          sign_in current_user
        end

        describe "GET export_users" do
          context "when user is admin" do
            subject { get :export_users, params: { format: "JSON" } }

            it "send data and returns 200 status code" do
              expect(subject.status).to eq 200
            end
          end

          context "when user is not admin" do
            subject { get :export_users, params: { format: "JSON" } }

            let(:current_user) { create :user, :confirmed, organization: organization }

            it "user is redirected because of permissions" do
              expect(subject.status).to eq 302
            end
          end
        end
      end
    end
  end
end
