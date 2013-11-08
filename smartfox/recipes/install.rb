rightscale_marker :begin

bash "download_smartfox" do
  code <<-EOM
    export STORAGE_ACCOUNT_ID="#{node[:smartfox][:storage_account_id]}"
    export STORAGE_ACCOUNT_SECRET="#{node[:smartfox][:storage_account_secret]}"
    /opt/rightscale/sandbox/bin/ros_util get -c "#{node[:smartfox][:bucket]}" -s "#{node[:smartfox][:file]}" -C "#{node[:smartfox][:provider]}" -d "#{Chef::Config[:file_cache_path]}/smartfox.tar.bz2"
  EOM
end

bash "untar_smartfox" do
  code <<-EOM
   tar jxvf "#{Chef::Config[:file_cache_path]}/smartfox.tar.bz2" -C /usr/local
   ln -s /usr/local/SFS_PRO_1.6.6 /usr/local/smartfox
 EOM
end

bash "start_smartfox" do
  code <<-EOM
    /usr/local/smartfox/Server/start.sh
  EOM
end
    
rightscale_marker :end
