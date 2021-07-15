# frozen_string_literal: true

module Decidim
  # This class serializes a User so can be exported to CSV
  module UserExporter
    class UserExportSerializer < Decidim::DataPortabilitySerializers::DataPortabilityUserSerializer
      # Public: Exports a hash with the serialized data for the user including
      # extra user fields
      def serialize
        super.merge(extra_fields)
      end

      def extra_fields
        extended_data = resource.extended_data.symbolize_keys

        Decidim::UserExporter.export_user_fields.each_with_object({}) do |key, fields|
          fields[key] = extended_data[key]
        end
      end
    end
  end
end
