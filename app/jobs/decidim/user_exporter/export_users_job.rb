# frozen_string_literal: true

module Decidim
  module UserExporter
    class ExportUsersJob < ApplicationJob
      queue_as :default

      def perform(user, name, export_data)
        ExportMailer.export(user, name, export_data).deliver_now
      end
    end
  end
end
