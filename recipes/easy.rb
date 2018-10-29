

package "build-essential" do
  action :install
end

package "python-dev" do
  action :install
end

package "libevent-dev" do
  action :install
end

package "git" do
  action :install
end


bash "install_greenlet" do
  user "root"
  code <<-EOH
    pip install greenlet
    pip install gevent
  EOH
  action :run
end