module Sinatra
  module YSD

    #
    # System middleware 
    #
    # Before process each request, it checks the connected user and sets in the Audi::Auditor
    #
    module System
  
      def self.registered(app)
    
        # Add the local folders to the views and translations     
        app.settings.views = Array(app.settings.views).push(
          File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'views')))
        app.settings.translations = Array(app.settings.translations).push(
          File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'i18n')))
          
      end
    
    end #System
  
  end #YSD
 
end #Sinatra