cookbook_file "#{node["devops-challenge"]["catalina_webapps"]}/#{node["devops-challenge"]["warname"]}" do
  source 'java-chef-test-artifact.war'
  mode 0755
  group "tomcat"
end

service "tomcat" do
  action [:start, :enable]
end
