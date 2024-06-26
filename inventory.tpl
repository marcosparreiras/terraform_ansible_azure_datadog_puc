[web]
${web_ip} ansible_user=acmeadmin ansible_ssh_private_key_file=./private_key.pem

[db]
${db_ip} ansible_user=acmeadmin ansible_ssh_private_key_file=./private_key.pem