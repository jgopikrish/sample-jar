
node["devops-challenge"]["packages"].each do |tomcat_pkg|
  package tomcat_pkg
end

template node["devops-challenge"]["tomcat_conf_path"] do
  source 'tomcat.conf.erb'
  mode 0644
  group 'tomcat'
end
