$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kms/api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "kms_api"
  s.version     = Kms::Api::VERSION
  s.authors     = ["Hitesh Kanwar"]
  s.email       = ["hiteshkanwar@gmail.com"]
  s.homepage    = "https://github.com/webgradus/kms_api"
  s.summary     = "Extension for KMS"
  s.description = "KMS Api allows to fetch data from kms_models."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'friendly_id', '~> 5.0.0'
  s.add_dependency 'kms', '>= 1.0.0'
  s.add_dependency 'kms_models', ">= 1.0.0"
  s.add_dependency 'graphql', '~> 1.6.4'
  s.add_dependency 'graphiql-rails', '>= 1.0.0'

  s.add_development_dependency 'combustion', '~> 0.5'
  s.add_development_dependency 'factory_girl_rails', '~> 4.8'
  s.add_development_dependency 'rspec-rails', '~> 3.5', '>= 3.5.0'
  s.add_development_dependency 'shoulda-matchers', '~> 3.1'
end
