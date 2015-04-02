Gem::Specification.new do |s|
  s.name    = "ysd_plugin_system"
  s.version = "0.1.9"
  s.authors = ["Yurak Sisa Dream"]
  s.date    = "2012-06-19"
  s.email   = ["yurak.sisa.dream@gmail.com"]
  s.files   = Dir['lib/**/*.rb','views/**/*.erb','i18n/**/*.yml','static/**/*.*'] 
  s.description = "System module integration"
  s.summary = "System module integration"
  
  s.add_runtime_dependency "json"

  s.add_runtime_dependency "ysd_core_plugins"
  s.add_runtime_dependency "ysd_yito_core"
  s.add_runtime_dependency "ysd_yito_js"
  
  s.add_runtime_dependency "ysd_md_configuration" 
  s.add_runtime_dependency "ysd_md_logger"
  s.add_runtime_dependency "ysd_md_business_events"
 
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rack"
  s.add_development_dependency "rack-test"
  s.add_development_dependency "sinatra"
  s.add_development_dependency "sinatra-r18n"
  s.add_development_dependency "dm-sqlite-adapter" # Model testing using sqlite  
  
end