Gem::Specification.new do |s|
  s.name    = "ysd_plugin_system"
  s.version = "0.1"
  s.authors = ["Yurak Sisa Dream"]
  s.date    = "2012-06-19"
  s.email   = ["yurak.sisa.dream@gmail.com"]
  s.files   = Dir['lib/**/*.rb','views/**/*.erb','i18n/**/*.yml','static/**/*.*'] 
  s.description = "System module integration"
  s.summary = "System module integration"
  
  s.add_runtime_dependency "ysd_mw_system"
  
end