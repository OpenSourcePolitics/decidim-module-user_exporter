# frozen_string_literal: true

module Decidim
  module UserExporter
    module Admin
      module ApplicationHelper
        # Renders an export dropdown for the provided component, including an item
        # for each exportable artifact and format.
        #
        # component - The component to render the export dropdown for. Defaults to the
        #           current component.
        #
        # Returns a rendered dropdown.
        def user_export_dropdown
          render partial: "decidim/admin/exports/dropdown"
        end
      end
    end
  end
end
