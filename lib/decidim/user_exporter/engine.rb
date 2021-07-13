# frozen_string_literal: true

require "rails"
require "decidim/core"

module Decidim
  module UserExporter
    # This is the engine that runs on the public interface of user_exporter.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::UserExporter

      routes do
        # Add engine routes here
        # resources :user_exporter
        # root to: "user_exporter#index"
      end
    end
  end
end
