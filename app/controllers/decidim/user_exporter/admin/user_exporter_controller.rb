# frozen_string_literal: true

module Decidim
  module UserExporter
    module Admin
      class UserExporterController < Decidim::Admin::ApplicationController
        def export_users
          enforce_permission_to :read, :officialization

          ExportUsers.call(params[:format], current_user) do
            on(:ok) do |export_data|
              send_data export_data.read, type: "text/#{export_data.extension}", filename: export_data.filename("participants")
            end
          end
        end
      end
    end
  end
end
