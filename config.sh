# /etc/ssh/sshd_config
Port 22
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
AllowUsers hradmin accadmin
Protocol 2
MaxAuthTries 3
LoginGraceTime 60
