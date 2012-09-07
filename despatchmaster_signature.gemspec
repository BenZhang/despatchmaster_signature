# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "despatchmaster_signature/version"

Gem::Specification.new do |s|
  s.name        = "despatchmaster_signature"
  s.version     = DespatchmasterSignature::VERSION
  s.authors     = ["BenZhang"]
  s.email       = ["bzbnhang@gmail.com"]
  s.homepage    = "https://github.com/BenZhang/despatchmaster_signature"
  s.summary     = %q{}
  s.description = %q{A gem that grab the signature from Despatch Master which is in Vector Array format and convert it into an image}

  s.rubyforge_project = "despatchmaster_signature"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rmagick"
end
