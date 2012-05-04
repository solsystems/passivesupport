# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "passivesupport/version"

Gem::Specification.new do |s|
  s.name        = "passivesupport"
  s.version     = "0.0.1"
  s.authors     = ["Caleb Thompson"]
  s.email       = ["caleb@solsystemscompany.com"]
  s.homepage    = ""
  s.summary     = %q{Utility classes and Ruby extensions for the masses}
  s.description = <<-DESC.gsub(/\s{2,}/g, ' ')
                    Passive Support is a collection of extensions to Ruby standard
                    library and a random smattering of gems that we use.
                  DESC
  s.rubyforge_project = "passivesupport"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
