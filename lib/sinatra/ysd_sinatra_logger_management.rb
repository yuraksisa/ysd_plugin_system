require 'ysd_md_integration'
module Sinatra
  module YSD
    module LoggerManagement
   
      def self.registered(app)
                    
        #
        # Log messages page
        #
        app.get "/admin/logger" do
          load_page :logger
        end
          
        #
        # Log configuration page
        #  
        app.get "/admin/logger-config" do
          load_page :logger_config
        end  
                
      end
    
    end #ForumManagement
  end #YSD
end #Sinatra