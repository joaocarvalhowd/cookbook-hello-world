execute "timezone" do
    command "unlink /etc/localtime && ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && date"
    action :run
end

package "nginx" do
    source "#{Chef::Config[:file_cache_path]}/nginx-1.8.0-1.el6.ngx.eotica.x86_64.rpm"
    action :install
end