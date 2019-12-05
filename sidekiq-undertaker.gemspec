# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sidekiq/undertaker/version"

Gem::Specification.new do |spec|
  spec.name          = "sidekiq-undertaker"
  spec.version       = Sidekiq::Undertaker::VERSION
  spec.authors       = ["Thomas Koppensteiner"]
  spec.email         = ["thomas.koppensteiner@gmx.net "]
  spec.summary       = "Sidekiq::Undertaker makes exploring the Sidekiq dead job queue easier"
  spec.description   = <<-DES
    Sidekiq::Undertaker is a plugin for Sidekiq.
    It makes exploring the dead job queue easier
    by breaking down the dead jobs into time windows (buckets) of hours and days.
    The gems allows retrying or deleting a certain subset of failures.
  DES
  spec.license       = "MIT"

  spec.homepage      = "https://github.com/ThomasKoppensteiner/sidekiq-undertaker"
  spec.metadata      = {
    "homepage_uri"     => "https://github.com/ThomasKoppensteiner/sidekiq-undertaker",
    "source_code_uri"  => "https://github.com/ThomasKoppensteiner/sidekiq-undertaker",
    "bug_tracker_uri"  => "https://github.com/ThomasKoppensteiner/sidekiq-undertaker/issues",
    "build_status_uri" => "https://travis-ci.org/ThomasKoppensteiner/sidekiq-undertaker"
  }

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib", "lib/sidekiq/undertaker"]

  spec.add_development_dependency "bundler", ">= 1.17", "<3"
  spec.add_development_dependency "rake", "~> 12.3"

  spec.add_development_dependency "approvals", "~> 0.0", ">= 0.0.24"
  spec.add_development_dependency "mock_redis", "~> 0.19"
  spec.add_development_dependency "pry", "~> 0.12"
  spec.add_development_dependency "rack-test", "~> 1.1"
  spec.add_development_dependency "rb-readline", "~> 0.5"
  spec.add_development_dependency "rspec", "~> 3.8"
  spec.add_development_dependency "rspec-core", "~> 3.8"
  spec.add_development_dependency "rspec-mocks", "~> 3.8"
  spec.add_development_dependency "rspec-sidekiq", "~> 3.0"
  spec.add_development_dependency "rt_rubocop_defaults", "~> 1.2"
  spec.add_development_dependency "rubocop", "~> 0.77"
  spec.add_development_dependency "rubocop-rspec", "~> 1.30"
  spec.add_development_dependency "rubocop_runner", "~> 2.1"
  spec.add_development_dependency "simplecov", "~> 0.14"
  spec.add_development_dependency "sinatra", "~> 2.0"
  spec.add_development_dependency "timecop", "~> 0.9"

  spec.add_runtime_dependency "sidekiq", "~> 5.2"
end