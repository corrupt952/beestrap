# Fluent Bit
# ログを収集してどこかに送る
# https://fluentbit.io/

execute "install fluentbit" do
  not_if "test -e /lib/systemd/system/fluent-bit.service"

  user "root"
  command "curl https://raw.githubusercontent.com/fluent/fluent-bit/master/install.sh | sh"
end

service "fluent-bit" do
  user "root"
  action [:enable, :start]
end
