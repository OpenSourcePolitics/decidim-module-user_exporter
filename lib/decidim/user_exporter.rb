# frozen_string_literal: true

require "decidim/user_exporter/admin"
require "decidim/user_exporter/engine"
require "decidim/user_exporter/admin_engine"
require "decidim/user_exporter/component"

module Decidim
  # This namespace holds the logic of the `UserExporter` component. This component
  # allows users to create user_exporter in a participatory space.

  # Define extra keys to export from 'extended_data' jsonb column
  config_accessor :export_user_fields do
    [:country, :postal_code]
  end
  # Define extra keys to export from 'extended_data' jsonb column
  config_accessor :export_users_formats do
    %w(CSV JSON Excel).freeze
  end

  module UserExporter
  end
end
