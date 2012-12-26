$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "docent/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "docent"
  s.version     = Docent::VERSION
  s.authors     = ["Aaron Sumner"]
  s.email       = ["asumner@mac.com"]
  s.homepage    = "https://github.com/ruralocity/docent"
  s.summary     = "Contextually-aware links to externally-hosted support docs."
  s.description = "Docent is a mountable Rails engine to provide your app's users with links to proper support documentation."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2"

  s.add_development_dependency "sqlite3"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", '~> 2.12.0'
  s.add_development_dependency "capybara", '~> 2.0.1'
  s.add_development_dependency "factory_girl_rails", '~> 4.1.0'
  s.add_development_dependency "database_cleaner"
end
