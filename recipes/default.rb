package "build-essential" do
  action :install
end

package "python-dev" do
  action :install
end

package "git" do
  action :install
end

package "libevent-dev" do
  action :install
end

python_package "greenlet" 


bash "install_gevent_pip" do
  user "root"
  cwd "#{Chef::Config[:file_cache_path]}"
  code <<-EOH
    pip install cython -e git://github.com/surfly/gevent.git@1.0rc2#egg=gevent
  EOH
  action :run
  not_if {File.exists?("#{Chef::Config[:file_cache_path]}/gevent_install")}
end


=begin
 
remote_file "#{Chef::Config[:file_cache_path]}/gevent-1.0b2.tar.gz" do
  source "http://gevent.googlecode.com/files/gevent-1.0b2.tar.gz"
  checksum '02ff9af54a51a1cfd369ab006a48de9b91e516c8'
  action :create_if_missing
  notifies :run, "bash[install_gevent]", :immediately
end

bash "install_gevent" do
  user "root"
  cwd "#{Chef::Config[:file_cache_path]}"
  code <<-EOH
    tar -xvf gevent-1.0b2.tar.gz
    cd gevent-1.0b2
    sudo python setup.py install
  EOH
  action :run
  not_if {File.exists?("#{Chef::Config[:file_cache_path]}/gevent_install")}
end
=end

file "#{Chef::Config[:file_cache_path]}/gevent_install" do
  owner "root"
  group "root"
  mode "0755"
  action :create
end