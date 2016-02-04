$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "chat/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "chat"
  s.version     = Chat::VERSION
  s.authors     = ["toptierlabs"]
  s.email       = ["anthfb@gmail.com"]
  s.homepage    = "http://www.toptierlabs.com"
  s.summary     = "Summary of Chat."
  s.description = "Description of Chat."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"
  s.add_dependency "jbuilder", "~> 1.2"

  s.add_development_dependency "sqlite3"
end
