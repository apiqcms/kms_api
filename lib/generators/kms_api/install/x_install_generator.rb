# require 'rails/generators'
# module KmsApi
#   class InstallGenerator < Rails::Generators::Base

#     source_root File.expand_path('../../../../../', __FILE__)

#     def insert_engine_routes
#       route %(
#   mount Kms::Api::Engine => '/kms'
#       )
#     end

#     def insert_javascript
#       append_file "app/assets/javascripts/application.js", "//= require kms_api/application\n"
#     end

#     def insert_stylesheet
#       gsub_file "app/assets/stylesheets/application.css", '*/', "*= require kms_api/application\n*/"
#     end

#   end
# end
