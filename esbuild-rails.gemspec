require_relative "lib/esbuild/version"

Gem::Specification.new do |spec|
  spec.name        = "esbuild-rails"
  spec.version     = Esbuild::VERSION
  spec.authors     = [ "David Heinemeier Hansson" ]
  spec.email       = "david@loudthinking.com"
  spec.homepage    = "https://github.com/rails/esbuild-rails"
  spec.summary     = "Bundle and transpile JavaScript in Rails with esbuild."
  spec.license     = "MIT"

  spec.files = Dir["lib/**/*", "MIT-LICENSE", "README.md"]

  spec.add_dependency "rails", ">= 6.0.0"
end
