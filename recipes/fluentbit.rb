# Fluent Bit
# ログを収集してどこかに送る
# https://fluentbit.io/

execute "install fluentbit" do
  not_if "test -e /lib/systemd/system/fluent-bit.service"

  user "root"
  command "curl https://raw.githubusercontent.com/fluent/fluent-bit/master/install.sh | sh"
end

# FIXME: mitmaeのバグか何かでuser rootを指定した場合に
#        一時ファイルは/tmp/Xに作成されるが、それを読み取ろうとしてエラーになり異常終了する
# template "/etc/fluent-bit/fluent-bit.conf" do
#   user "root"
#   action :create
#   source "fluentbit/fluent-bit.conf"
# end

# template "/etc/fluent-bit/parsers.conf" do
#   user "root"
#   action :create
#   source "fluentbit/parsers.conf"
# end

service "fluent-bit" do
  user "root"
  action [:enable, :start]
end
