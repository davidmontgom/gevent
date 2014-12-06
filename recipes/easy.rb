

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

easy_install_package "greenlet" do
  action :install
end

easy_install_package "gevent" do
  action :install
end

