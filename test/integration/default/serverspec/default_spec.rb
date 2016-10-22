require_relative 'spec_helper'

packages =['tomcat', 'tomcat-webapps', 'tomcat-admin-webapps']

describe ('Validate tomcat packages are install') do
  packages.each do |package_name|
    describe package(package_name) do
      it { should be_installed }
    end
  end
end

describe ('Validate tomcat.conf exists') do
    describe file("/etc/tomcat/tomcat.conf") do
      it { should exist }
      it { should contain 'JAVA_HOME' }
      it { should contain 'CATALINA_HOME' }
      it { should contain 'CATALINA_TMPDIR' }
      it { should contain 'TOMCATS_BASE' }
  end
end

describe ('validate tomcat service exits') do
  describe service('tomcat') do
    it {should be_running}
  end
end

describe ('validating artifact got deployed or not') do
  describe file('/usr/share/tomcat/webapps/java-artifact-chef-test.war') do
    it { should exist }
  end
  describe command('curl http://localhost:8080/java-artifact-chef-test/chef/ping') do
    its(:exit_status) { should eq 0 }
  end
end
