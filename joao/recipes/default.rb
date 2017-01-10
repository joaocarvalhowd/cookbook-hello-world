remote_file "#{Chef::Config[:file_cache_path]}/webtatic-release-6.rpm" do
    source "https://mirror.webtatic.com/yum/el6/latest.rpm"
    action :create
end

package "webtatic repository" do
    source "#{Chef::Config[:file_cache_path]}/webtatic-release-6.rpm"
    action :install
end

remote_file "#{Chef::Config[:file_cache_path]}/nginx-1.8.0-1.el6.ngx.x86_64.rpm" do
    source "https://nginx.org/packages/rhel/6/x86_64/RPMS/nginx-1.8.0-1.el6.ngx.x86_64.rpm"
    action :create
end

execute "timezone" do
    command "unlink /etc/localtime && ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && date"
    action :run
end

package "nginx" do
    source "#{Chef::Config[:file_cache_path]}/nginx-1.8.0-1.el6.ngx.x86_64.rpm"
    action :install
end

user "nginx" do
  uid '496'
  action :modify
end

package "php70w" do
  action :install
end

package "php70w-fpm" do
  action :install
end

service "php-fpm" do
  action [ :enable, :start ]
  supports :restart => true
end

service "nginx" do
  action [ :enable, :start ]
  supports :restart => true
end
