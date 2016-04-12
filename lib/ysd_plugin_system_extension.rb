require 'ysd-plugins_viewlistener' unless defined?Plugins::ViewListener
require 'ysd_md_configuration' unless defined?SystemConfiguration::Variable

#
# Site Extension
#
module Huasi

  class SystemExtension < Plugins::ViewListener

    # ========= Installation =================

    # 
    # Install the plugin
    #
    def install(context={})
            
        SystemConfiguration::Variable.first_or_create({:name => 'logger_level'}, 
          {:value => 3, :description => 'logger level', :module => :system}) 
                                                      
        SystemConfiguration::Variable.first_or_create({:name => 'logger_max_size'}, 
          { :value => 2000, :description => 'logger max size (#records)', :module => :system})
                                                             
    end

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
                                  :link_route => "/admin/logger",
                                  :description => 'Reads the logs',
                                  :module => :system,
                                  :weight => 1}
                    },
                    {:path => '/system/business-events',              
                     :options => {:title => app.t.system_admin_menu.business_event,
                                  :link_route => "/admin/business-events",
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
    
      routes = [{:path => '/admin/system',
                 :parent_path => '/admin',
                 :regular_expression => /^\/admin\/system/, 
                 :title => 'Sistema', 
                 :description => 'Reads the log messages',
                 :fit => 1,
                 :module => :system },
                {:path => '/admin/logger',
                 :parent_path => '/admin/system',
                 :regular_expression => /^\/admin\/logger/, 
                 :title => 'Trazas', 
                 :description => 'Reads the log messages',
                 :fit => 1,
                 :module => :system },
                {:path => '/logger-config',
                 :regular_expression => /^\/admin\/logger-config/, 
                 :title => 'Logger configuration', 
                 :description => 'Configure the logger',
                 :fit => 1,
                 :module => :system },                 
                {:path => '/business-events',
                 :regular_expression => /^\/admin\/business-events/,                  
                 :title => 'Business events',
                 :description => 'Manage the business events.',
                 :fit => 1,
                 :module => :system }]
      
    end

  end #SystemExtension
end #Huasi