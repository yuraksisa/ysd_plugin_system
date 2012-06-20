require 'ysd-plugins' unless defined?Plugins::Plugin

Plugins::SinatraAppPlugin.register :system do

   name=        'system'
   author=      'yurak sisa'
   description= 'System integration'
   version=     '0.1'
   sinatra_extension Sinatra::YSD::System
end