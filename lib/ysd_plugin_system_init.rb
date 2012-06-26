require 'ysd-plugins' unless defined?Plugins::Plugin

Plugins::SinatraAppPlugin.register :system do

   name=        'system'
   author=      'yurak sisa'
   description= 'System integration'
   version=     '0.1'
   sinatra_extension Sinatra::SystemExtension
   sinatra_extension Sinatra::YSD::System
   sinatra_extension Sinatra::YSD::BusinessEventManagement
   sinatra_extension Sinatra::YSD::BusinessEventRESTApi
   sinatra_extension Sinatra::YSD::LoggerManagement
   sinatra_extension Sinatra::YSD::LoggerRESTApi
   hooker Huasi::SystemExtension
end