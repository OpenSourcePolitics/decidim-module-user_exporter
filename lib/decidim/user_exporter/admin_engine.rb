# frozen_string_literal: true

module Decidim
  module UserExporter
    # This is the engine that runs on the public interface of `UserExporter`.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::UserExporter::Admin

      paths["db/migrate"] = nil
      paths["lib/tasks"] = nil

      routes do
        # Add admin engine routes here
        # resources :user_exporter do
        #   collection do
        #     resources :exports, only: [:create]
        #   end
        # end
        # root to: "user_exporter#index"
      end

      def load_seed
        nil
      end
    end
  end
end
