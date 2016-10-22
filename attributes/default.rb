
default['java']['oracle']['accept_oracle_download_terms'] = true
default["java"]["install_flavor"] = "oracle"
default["java"]["jdk_version"] = "7"

# Tomcat packages
default["devops-challenge"]["packages"] = %w(tomcat tomcat-webapps tomcat-admin-webapps)

# catalina paths
default["devops-challenge"]["catalina_home"] = "/usr/share/tomcat/"
default["devops-challenge"]["catalina_webapps"] = "/usr/share/tomcat/webapps"
default["devops-challenge"]["warname"] = "java-artifact-chef-test.war"
default["devops-challenge"]["tomcat_conf_path"] = "/etc/tomcat/tomcat.conf"
