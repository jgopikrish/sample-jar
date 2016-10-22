
require 'serverspec'

RSpec.configure do |c|
  c.before :all do
    set :backend, :exec
    set :path, '/bin/sh:/sbin:/usr/local/sbin:$PATH'
  end
end
