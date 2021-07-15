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
              expect(subject).to have_http_status(:ok)
            end

            it "send email with export" do
            end
          end

          context "when user is not admin" do
            subject { get :export_users, params: { format: "JSON" } }

            let(:current_user) { create :user, :confirmed, organization: organization }

            it "user is redirected because of permissions" do
              expect(subject).to have_http_status(302)
            end
          end

          context "with format" do
            shared_examples_for "export with format" do |format|
              subject { get :export_users, params: { format: format } }

              it "returns a 200 status code" do
                expect(subject).to have_http_status(:ok)
              end
            end

            it_behaves_like "export with format", "CSV"
            it_behaves_like "export with format", "JSON"
            it_behaves_like "export with format", "Excel"
            context "when format is invalid" do
              subject { get :export_users, params: { format: "invalid_format" } }

              it "rescue error and broadcast invalid message" do
                subject
                expect(flash[:alert]).not_to be_empty
                expect(flash[:alert]).to eq("an error has occured")
              end
            end
          end
        end
      end
    end
  end
end
