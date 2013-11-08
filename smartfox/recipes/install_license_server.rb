rightscale_marker :begin

bash "download_smartfox" do
  code <<-EOM
    export STORAGE_ACCOUNT_ID="#{node[:smartfox][:storage_account_id]}"
    export STORAGE_ACCOUNT_SECRET="#{node[:smartfox][:storage_account_secret]}"
    /opt/rightscale/sandbox/bin/ros_util get -c "#{node[:smartfox][:bucket]}" -s "#{node[:smartfox][:file]}" -C "#{node[:smartfox][:provider]}" -d "#{Chef::Config[:file_cache_path]}/smartfox.tar.gz"
  EOM
end

bash "untar_smartfox" do
  code <<-EOM
   tar zxvf "#{Chef::Config[:file_cache_path]}/smartfox.tar.gz" -C /usr/local
   ln -s /usr/local/SFS_PRO_1.6.6 /usr/local/smartfox
   ln -s /usr/local/sfsls-linux-x86-64 /usr/local/smartfox
 EOM
end

bash "start_smartfox" do
  code <<-EOM
    /usr/local/smartfox/sfsls start
  EOM
end
    
rightscale_marker :end
