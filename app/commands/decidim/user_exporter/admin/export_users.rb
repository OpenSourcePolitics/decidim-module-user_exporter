# frozen_string_literal: true

module Decidim
  module UserExporter
    module Admin
      class ExportUsers < Rectify::Command
        # format - a string representing the export format
        # current_user - the user performing the action
        def initialize(format, current_user)
          @format = format
          @current_user = current_user
        end

        # Exports the current organization not deleted users.
        #
        # Broadcasts :ok if successful, :invalid otherwise.
        def call
          send_export_mail

          broadcast(:ok)
        rescue StandardError
          broadcast(:invalid)
        end

        private

        attr_reader :current_user, :format

        def send_export_mail
          ExportMailer.export(current_user, "users", export_data).deliver_now
        end

        def export_data
          Decidim.traceability.perform_action!(
            :export_users,
            current_user,
            current_user
          ) do
            Decidim::Exporters
              .find_exporter(format)
              .new(collection, Decidim::UserExporter::UserExportSerializer)
              .export
          end
        end

        def collection
          current_organization.users.not_deleted
        end
      end
    end
  end
end
