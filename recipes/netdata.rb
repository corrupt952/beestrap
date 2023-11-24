# Netdata
# メトリクスを収集して可視化するツール
# https://www.netdata.cloud/

execute "install netdata" do
  not_if "test -e /usr/sbin/netdata"

  user "root"
  command "bash -lc 'bash <(curl -Ss https://my-netdata.io/kickstart.sh) --stable-channel'"
end

# MySQL
# file "/etc/netdata/go.d/mysql.conf" do
#   only_if "test -e /usr/bin/mysql"

#   user "root"
#   action :create
#   content <<~EOF
#   jobs:
#     - name: local
#       dsn: netdata@unix(/var/run/mysqld/mysqld.sock)/
#   EOF
# end
