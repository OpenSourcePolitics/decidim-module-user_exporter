# frozen_string_literal: true

module Decidim
  module UserExporter
    module Admin
      class UserExporterController < Decidim::Admin::ApplicationController
        def export_users
          enforce_permission_to :read, :officialization

          ExportUsers.call(params[:format], current_user) do
            on(:ok) do |export_data|
              ExportUsersJob.perform_now current_user, "users", export_data
            end
            on(:invalid) do
              flash.now[:alert] = t(".error")
            end
          end
        end
      end
    end
  end
end
