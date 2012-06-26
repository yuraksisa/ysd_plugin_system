require 'ysd-plugins_viewlistener' unless defined?Plugins::ViewListener

#
# Site Extension
#
module Huasi

  class SystemExtension < Plugins::ViewListener

    # --------- Menus --------------------
    
    #
    # It defines the admin menu menu items
    #
    # @return [Array]
    #  Menu definition
    #
    def menu(context={})
      
      app = context[:app]

      menu_items = [{:path => '/system',
                     :options => {
                     	:title => app.t.system_admin_menu.system_menu,
                        :description => 'System menu',
                        :module => :system,
                        :weight => 0
                     }
                    },
                    {:path => '/system/logger',              
                     :options => {:title => app.t.system_admin_menu.logger,
                                  :link_route => "/logger",
                                  :description => 'Reads the logs',
                                  :module => :system,
                                  :weight => 1}
                    },
                    {:path => '/system/logger',              
                     :options => {:title => app.t.system_admin_menu.business_event,
                                  :link_route => "/business-events",
                                  :description => 'Manages business events',
                                  :module => :system,
                                  :weight => 0}
                    }
                    ]                      
    
    end    

    # ========= Routes ===================
    
    # routes
    #
    # Define the module routes, that is the url that allow to access the funcionality defined in the module
    #
    #
    def routes(context={})
    
      routes = [{:path => '/logger',
                 :regular_expression => /^\/logger/, 
                 :title => 'Logger', 
                 :description => 'Reads the log messages',
                 :fit => 1,
                 :module => :system },
                {:path => '/business-events',
                 :regular_expression => /^\/business-events/,                  
                 :title => 'Business events',
                 :description => 'Manage the business events.',
                 :fit => 1,
                 :module => :system }]
      
    end

  end #SystemExtension
end #Huasi