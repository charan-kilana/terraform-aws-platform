#!/bin/bash
set -euxo pipefail

exec > >(tee /var/log/user-data.log | logger -t user-data -s 2>/dev/console) 2>&1

dnf install -y httpd
sed -i "s/^Listen 80$/Listen ${app_port}/" /etc/httpd/conf/httpd.conf

cat >/var/www/html/index.html <<EOF
<!doctype html>
<html lang="en">
  <head><meta charset="utf-8"><title>Platform application</title></head>
  <body>
    <h1>Terraform platform application</h1>
    <p>Environment: ${environment}</p>
    <p>Instance: $(hostname)</p>
  </body>
</html>
EOF

systemctl enable --now httpd
