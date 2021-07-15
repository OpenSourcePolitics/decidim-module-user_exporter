# frozen_string_literal: true

module Decidim
  module UserExporter
    module Admin
      module ApplicationHelper
        # Renders an export dropdown for users
        # Returns a rendered dropdown.
        def user_export_dropdown
          render partial: "decidim/admin/exports/dropdown_export_user"
        end
      end
    end
  end
end
