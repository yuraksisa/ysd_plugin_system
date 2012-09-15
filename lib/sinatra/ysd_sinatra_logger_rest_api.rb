require 'ysd_md_logger'
module Sinatra
  module YSD
    module LoggerRESTApi
   
      def self.registered(app)

        app.set :log_messages_page_size, 20 
                            
        #
        # Retrieve log messages (POST)
        #
        ["/log-messages","/log-messages/page/:page"].each do |path|
          app.post path do

            page = params[:page].to_i || 1
            limit = settings.log_messages_page_size
            offset = (page-1) * limit
          
            data  = Model::LogRecord.all({:limit => limit, :offset => offset, :order=>[:id.desc]}) 
                    #Model::LogMessage.all({:limit => limit, :offset => offset, :order=>[:id.desc]})
            total = Model::LogRecord.count
                    #Model::LogMessage.count
            
            content_type :json
            {:data => data, :summary => {:total => total}}.to_json
          
          end
        
        end
        
        #
        # Deletes all log messages (DELETE)
        #
        app.delete "/log-messages" do
                
          Model::LogRecord.destroy
          #Model::LogMessage.destroy
          
          content_type :json
          true.to_json
        
        end
        
        #
        # Deletes a log message (DELETE)
        #
        app.delete "/log-message" do

          request.body.rewind
          log_message_request = JSON.parse(URI.unescape(request.body.read))

          if log_message = Model::LogRecord.get(log_message_request['id'])
            #Model::LogMessage.get(log_message_request['id'])
            log_message.destroy
          end
          
          content_type :json
          true.to_json
        
        end
      
        #
        # Gets the logger configuration (GET)
        #
        app.get "/logger-configuration" do
        
          logger_configuration = {}
        
          logger_configuration.store(:logger_level, SystemConfiguration::Variable.get_value('logger_level', 1))
          logger_configuration.store(:logger_max_size, SystemConfiguration::Variable.get_value('logger_max_size', 2000))
          
          content_type :json
          logger_configuration.to_json 
        
        end
        
        #
        # Updates the log configuration (PUT)
        #
        app.put "/logger-configuration" do
      
          request.body.rewind
          logger_config_request = JSON.parse(URI.unescape(request.body.read))      
          
          logger_configuration = {}
          
          logger_config_request.each do |key, value|
            if variable = SystemConfiguration::Variable.get(key)
              variable.value = value
              variable.save
            end         
          end
          
          content_type :json
          true.to_json
      
        end
        
      end
    
    end #LoggerRESTApi
  end #YSD
end #Sinatra