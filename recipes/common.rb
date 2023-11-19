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

# プロセスを可視化するツール
# https://htop.dev/
package 'htop' do
  user 'root'
  action :install
end
