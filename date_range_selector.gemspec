$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "date_range_selector/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "date_range_selector"
  s.version     = DateRangeSelector::VERSION
  s.authors     = ["Driftrock"]
  s.email       = ["dev@driftrock.com"]
  s.homepage    = "http://www.driftrock.com"
  s.summary     = "Date Range selector to make it easier to generate reports"
  s.description = "Allow to add a date selector range with session persistence"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.1.9"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "simplecov"
end
