execute "apt update" do
  user "root"
  command "apt update"
end

# Web UIでサーバーを管理するためのツール
# https://cockpit-project.org/
package 'cockpit' do
  user 'root'
  action :install
end

# プロセスを可視化するツール
# https://htop.dev/
package 'htop' do
  user 'root'
  action :install
end

# メトリクスを収集して可視化するツール
# https://www.netdata.cloud/
execute "install netdata" do
  user "root"
  command "bash <(curl -Ss https://my-netdata.io/kickstart.sh) --stable-channel"
  not_if "test -e /usr/sbin/netdata"
end
