$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "devise/uncommon_password/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "devise-uncommon_password"
  s.version     = Devise::UncommonPassword::VERSION
  s.authors     = ["Chris Larsen"]
  s.email       = ["clarsenipod@gmail.com"]
  s.homepage    = "https://github.com/HCLarsen/devise-uncommon_passwords"
  s.summary     = "Devise extension to prevent users from using a common password."
  s.description = "Devise extension to prevent users from using a common password."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.2", "< 5.3"
  s.add_dependency "devise", ">= 3.5", "< 4.7"

  s.add_development_dependency "sqlite3"
end
