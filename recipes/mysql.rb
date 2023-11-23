execute "apt update" do
  user "root"
  command "apt update"
end

# MySQLサーバをインストール
package "mysql-server" do
  user "root"
  action :install
end

file "/etc/netdata/go.d/mysql.conf" do
  user "root"
  action :create
  content <<~EOF
  jobs:
    - name: local
      dsn: netdata@unix(/var/run/mysqld/mysqld.sock)/
  EOF
end
