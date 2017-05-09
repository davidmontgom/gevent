

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

python_package "greenlet" 

python_package "gevent" 

