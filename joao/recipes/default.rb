remote_file "#{Chef::Config[:file_cache_path]}/webtatic-release-6.rpm" do
    source "https://mirror.webtatic.com/yum/el6/latest.rpm"
    action :create
end

package "webtatic repository" do
    source "#{Chef::Config[:file_cache_path]}/webtatic-release-6.rpm"
    action :install
end

remote_file "#{Chef::Config[:file_cache_path]}/nginx-1.8.0-1.el6.ngx.eotica.x86_64.rpm" do
    source "https://static.eotica.com.br/infrastructure/rpm/nginx-1.8.0-1.el6.ngx.eotica.x86_64.rpm"
    action :create
end

execute "timezone" do
    command "unlink /etc/localtime && ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && date"
    action :run
end

package "nginx" do
    source "#{Chef::Config[:file_cache_path]}/nginx-1.8.0-1.el6.ngx.eotica.x86_64.rpm"
    action :install
end

package "php70w-fpm" do
  action :install
end