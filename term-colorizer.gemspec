$:.push File.expand_path("../lib", __FILE__)
require "term-colorizer/version"

Gem::Specification.new do |s|
  s.name = "term-colorizer"
  s.version = Term::Colorizer::VERSION
  s.authors = [ "Vishal Telangre" ]
  s.email = "the@vishaltelangre.com"
  s.platform = Gem::Platform::RUBY
  s.required_rubygems_version = '>= 1.3.6'
  s.files = `git ls-files`.split("\n")
  s.require_paths = [ "lib" ]
  s.homepage = "http://github.com/vishaltelangre/term-colorizer"
  s.licenses = [ "MIT" ]
  s.summary = "Print colorized strings on terminal (Useful for printing fancy logs)"
end
