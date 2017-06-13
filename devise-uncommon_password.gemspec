$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "devise/uncommon_password/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "devise-uncommon_password"
  s.version     = Devise::UncommonPassword::VERSION
  s.authors     = ["Chris Larsen"]
  s.email       = ["clarsenipod@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Devise::UncommonPassword."
  s.description = "TODO: Description of Devise::UncommonPassword."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.1"

  s.add_development_dependency "sqlite3"
end
