yum install nfs-utils
yum install -y wget
systemctl enable firewalld --now
firewall-cmd --add-service="nfs3" --add-service="rpc-bind" --add-service="mountd" --permanent 
firewall-cmd --reload
systemctl enable nfs --now
wget -P /home/vagrant/ https://raw.githubusercontent.com/olegizt/DZ6_NFS/main/s_check.sh
chmod +x /home/vagrant/s_check.sh
mkdir -p /srv/share/upload
chown -R nfsnobody:nfsnobody /srv/share
chmod 0777 /srv/share/upload
cat << EOF > /etc/exports
/srv/share 192.168.50.11/32(rw,sync,root_squash)
EOF
exportfs -r


echo '#!/bin/bash' >> /usr/local/sbin/motd.sh
chmod +x /usr/local/sbin/motd.sh
echo 'printf "\e[0;37;42mПривет! Проверка настроек ДЗ по NFS на сервере. Запустите скрипт s_check.sh\e[0m\n"' >> /usr/local/sbin/motd.sh
echo "PrintMotd no" >> /etc/ssh/sshd_config
systemctl restart sshd
echo '/usr/local/sbin/motd.sh' >> /etc/profile