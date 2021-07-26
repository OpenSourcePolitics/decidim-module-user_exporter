# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/user_exporter/version"

Gem::Specification.new do |s|
  s.version = Decidim::UserExporter.version
  s.authors = ["quentinchampenois"]
  s.email = ["26109239+Quentinchampenois@users.noreply.github.com"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/decidim/decidim-module-user_exporter"
  s.required_ruby_version = ">= 2.6.5"

  s.name = "decidim-user_exporter"
  s.summary = "A decidim user_exporter module"
  s.description = "Allow Decidim administrators to export user data from backoffice."

  s.files = Dir["{app,config,lib}/**/*", "LICENSE-AGPLv3.txt", "Rakefile", "README.md"]

  s.add_dependency "decidim-core", Decidim::UserExporter.version
end
