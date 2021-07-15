# frozen_string_literal: true

module Decidim
  module UserExporter
    # This is the engine that runs on the public interface of `UserExporter`.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::UserExporter::Admin

      DEFAULT_EXPORT_FORMATS = %w(CSV JSON Excel).freeze

      paths["db/migrate"] = nil
      paths["lib/tasks"] = nil

      routes do
        namespace :user_exporter do
          get :export_users
        end
        root to: "user_exporter#export_users"
      end

      initializer "decidim_user_exporter.admin_mount_routes" do
        Decidim::Core::Engine.routes do
          mount Decidim::UserExporter::AdminEngine, at: "/admin/user_exporter", as: "decidim_user_exporter"
        end
      end

      initializer "decidim_user_exporter_fields.admin_export_users" do
        Decidim::Admin::ApplicationHelper.class_eval do
          include UserExporter::Admin::ApplicationHelper
        end
      end

      def load_seed
        nil
      end
    end
  end
end
