# -*- encoding: utf-8 -*-
# stub: figaro 0.7.0 ruby lib

Gem::Specification.new do |s|
  s.name = "figaro"
  s.version = "0.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Steve Richert"]
  s.date = "2013-06-27"
  s.description = "Simple, Heroku-friendly Rails app configuration using ENV and a single YAML file"
  s.email = "steve.richert@gmail.com"
  s.homepage = "https://github.com/laserlemon/figaro"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.11"
  s.summary = "Simple Rails app configuration"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bundler>, ["~> 1.0"])
      s.add_runtime_dependency(%q<rails>, ["< 5", ">= 3"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<rails>, ["< 5", ">= 3"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<rails>, ["< 5", ">= 3"])
  end
end
