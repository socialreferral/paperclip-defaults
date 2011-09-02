# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "paperclip-defaults/version"

Gem::Specification.new do |s|
  s.name        = "paperclip-defaults"
  s.version     = Paperclip::Defaults::VERSION
  s.authors     = ["Mark Kremer"]
  s.email       = ["mark@socialreferral.com"]
  s.homepage    = ""
  s.summary     = %q{Configurable application wide defaults for Paperclip}
  s.description = %q{Configurable application wide defaults for Paperclip}

  s.required_ruby_version = '~> 1.9.2'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "minitest"
  s.add_development_dependency "mocha"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-bundler"
  s.add_development_dependency "guard-minitest"
  s.add_development_dependency "rb-inotify" if RbConfig::CONFIG['target_os'] == 'linux'
  s.add_development_dependency "libnotify" if RbConfig::CONFIG['target_os'] == 'linux'
  s.add_development_dependency "activerecord"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rake"

  s.add_runtime_dependency "paperclip"
  s.add_runtime_dependency "activesupport"
  s.add_runtime_dependency "rails"
end
