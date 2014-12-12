require 'ysd_md_integration'
module Sinatra
  module YSD
    module BusinessEventManagement
   
      def self.registered(app)
            
        #
        # Forums management page
        #
        app.get "/admin/business-events" do
          load_page :business_events
        end
                
      end
    
    end #ForumManagement
  end #YSD
end #Sinatra