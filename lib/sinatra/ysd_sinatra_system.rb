require 'ysd_md_system' unless defined?YSD::System::Request

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
        app.settings.views = Array(app.settings.views).push(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'views')))
        app.settings.translations = Array(app.settings.translations).push(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'i18n')))
    
        #
        # Before filter 
        #
        # It holds the user and redefines the System::Request.connected_user method
        #
        app.before /^[^.]*$/ do
      
          if Model::System::Request.method_defined?(:connected_user)
            Model::System::Request.send(:remove_method, :connected_user)
          end
      
          if user
                   
            # Create a closure because we want to hold the user in the System::Request scope
          
            connected_user = user
            proc = Proc.new { connected_user }
          
            Model::System::Request.send(:define_method, :connected_user) do
              puts "Invoking connected_user (request)"
              proc.call
            end
                      
         else

            Model::System::Request.send(:define_method, :connected_user) do
              nil
            end 

         end      

       end    
    
      
      end
    
    end #System
  
  end #YSD
 
end #Sinatra