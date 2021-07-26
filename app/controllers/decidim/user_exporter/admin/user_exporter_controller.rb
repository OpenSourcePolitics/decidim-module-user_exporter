# frozen_string_literal: true

module Decidim
  module UserExporter
    module Admin
      class UserExporterController < Decidim::Admin::ApplicationController
        def export_users
          enforce_permission_to :read, :officialization

          ExportUsers.call(params[:format], current_user) do
            on(:ok) do
              flash[:notice] = t("notice", scope: "decidim.admin.exports")
            end
            on(:invalid) do
              flash[:alert] = t(".error")
            end
          end

          redirect_back(fallback_location: decidim_admin.officializations_path)
        end
      end
    end
  end
end
