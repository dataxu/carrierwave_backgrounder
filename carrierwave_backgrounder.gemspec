# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require "backgrounder/version"

Gem::Specification.new do |s|
  s.name        = "carrierwave_backgrounder"
  s.version     = CarrierWave::Backgrounder::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Larry Sprock"]
  s.email       = ["larry@lucidbleu.com"]
  s.homepage    = ""
  s.summary     = %q{Offload CarrierWave's image processing and storage to a background process using Delayed Job}

  s.rubyforge_project = "carrierwave_backgrounder"

  # TODO HACK RUBY1.9.3 MOort 3/22/2013 I'm not exactly sure why production Phusion Passenger tries to call these now with
  # new Passenger. It doesn't call for other gems.
  # When it does there is no git installed on the machines and the application doesn't start.
  # Don't know what the proper solution is but I'm appending "rescue []" to the lines to avoid this problem
  #
  s.files         = `git ls-files`.split("\n") rescue []
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")  rescue []
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }  rescue []
  s.require_paths = ["lib"]

  s.add_dependency "carrierwave", ["~> 0.5"]

  s.add_development_dependency "rspec", ["2.5.0"]
  s.add_development_dependency "mocha", ["~> 0.9"]
  s.add_development_dependency "rake"
end
