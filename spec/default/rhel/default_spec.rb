require 'chefspec'
require_relative '../../spec_helper'

describe 'devops-challenge::default' do
  let(:chef_run) { ChefSpec::ServerRunner.new(:platform => 'centos', :version => '7.0').converge(described_recipe, 'java') }

context 'as a standalone installation' do
  it 'Includes tomcat recipes' do
    expect(chef_run).to include_recipe('devops-challenge::_tomcat')
    expect(chef_run).to include_recipe('devops-challenge::_deploy')
  end

  it 'installs tomcat packages' do
    expect(chef_run).to install_package('tomcat')
    expect(chef_run).to install_package('tomcat-webapps')
    expect(chef_run).to install_package('tomcat-admin-webapps')
  end

  it 'creates war file' do
    expect(chef_run).to create_cookbook_file("/usr/share/tomcat/webapps/java-artifact-chef-test.war")
  end

  it 'starts tomcat service' do
    expect(chef_run).to start_service('tomcat')
  end

  it 'creates tomcat.conf file' do
    expect(chef_run).to create_template("/etc/tomcat/tomcat.conf")
  end
end
end
