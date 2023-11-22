# Web UIでサーバーを管理するためのツール
# https://cockpit-project.org/
package 'cockpit' do
  user 'root'
  action :install
end

# メトリクスを収集して可視化するツール
# https://www.netdata.cloud/
package 'netdata' do
  user 'root'
  action :install
end
execute "change netadata binding address" do
  user "root"
  command "sed -i -e 's/bind socket to IP = 127.0.0.1/bind socket to IP = 0.0.0.0/g' /etc/netdata/netdata.conf"
end
service 'netdata' do
  user 'root'
  action :restart
end

# プロセスを可視化するツール
# https://htop.dev/
package 'htop' do
  user 'root'
  action :install
end
