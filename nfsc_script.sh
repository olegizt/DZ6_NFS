yum install nfs-utils
yum install -y wget
systemctl enable firewalld --now
echo "192.168.50.10:/srv/share/ /mnt nfs vers=3,proto=udp,noauto,x-systemd.automount 0 0" >> /etc/fstab
systemctl daemon-reload
systemctl restart remote-fs.target
wget -P /home/vagrant/ https://raw.githubusercontent.com/olegizt/DZ6_NFS/main/c_check.sh
chmod +x /home/vagrant/c_check.sh


echo '#!/bin/bash' >> /usr/local/sbin/motd.sh
chmod +x /usr/local/sbin/motd.sh
echo 'printf "\e[0;37;42mПривет! Проверка настроек ДЗ по NFS на клиенте. Запустите скрипт с_check.sh\e[0m\n"' >> /usr/local/sbin/motd.sh
echo "PrintMotd no" >> /etc/ssh/sshd_config
systemctl restart sshd
echo '/usr/local/sbin/motd.sh' >> /etc/profile
