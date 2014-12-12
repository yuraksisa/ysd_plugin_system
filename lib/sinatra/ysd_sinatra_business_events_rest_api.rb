require 'uri' unless defined?URI
require 'json' unless defined?JSON
require 'ysd-md-business_events' unless defined?BusinessEvent

module Sinatra
  module YSD
    #
    # Business events REST API
    #
    module BusinessEventRESTApi
   
      def self.registered(app)
         
        app.set :business_events_page_size, 20 

        app.helpers do
          def prepare_business_event(business_event)
             bep = business_event.business_event_processes.map do |bep| 
               {:command_name => bep.command_name, :status => bep.status, 
                :last_update => bep.last_update, :error => bep.error} 
             end                              
             business_event.attributes.merge({:business_events_processes => bep})       
          end
        end   
                            
        #
        # Retrieve business events (POST)
        #
        ["/api/business-events","/api/business-events/page/:page"].each do |path|
          app.post path do

            page = params[:page].to_i || 1
            limit = settings.business_events_page_size
            offset = (page-1) * limit
          
            data, total  = BusinessEvents::BusinessEvent.find_all(
              {:limit => limit, :offset => offset})
            
            # Retrieve the processes information
            data = data.map do |be|
              prepare_business_event(be)
            end
            
            content_type :json
            {:data => data, :summary => {:total => total}}.to_json
          
          end
        
        end
        
        #
        # Deletes a log message (DELETE)
        #
        app.delete "/api/business-event" do
        
          request.body.rewind
          business_event_request = JSON.parse(URI.unescape(request.body.read))

          if be=BusinessEvents::BusinessEvent.get(business_event_request['id'])
            be.destroy
          end
          
          content_type :json
          true.to_json
        
        end
      
      end
    
    end #BusinessEventRESTApi
  end #YSD
end #Sinatra