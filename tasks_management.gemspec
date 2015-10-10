$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tasks_management/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tasks_management"
  s.version     = TasksManagement::VERSION
  s.authors     = ["Adrian Chang"]
  s.email       = ["adrian.chang.alcover@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of TasksManagement."
  s.description = "TODO: Description of TasksManagement."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.3"

  s.add_development_dependency "sqlite3"
end
