#!/bin/bash
#更改ssh连接端口并开启密钥登陆工具
echo '============================
      SSH Key Installer
	      V1.0 Alpha
		Author:Lithromantic
============================'
echo "请输入新的SSH端口："
read -p "(默认端口: 22):" ss
[ -z "$ss" ] && ss="22"
echo "您输入的端口为$ss，确认请回车，否则请ctrl+c退出"
read ps
#请使用xshell生成公钥来替换下面的AAAA-LW8=这段密钥。
mkdir -p /root/.ssh && chmod 600 /root/.ssh && echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA4+itiSggwN8bnlFgPjkCTQ6ajgjbBDVk2/SWh7ZTDpmw3Zjc6F4zYE0tdGlTug2i2XdoDOsEgdgNE+UKilcMxYoq52VuRGPWfpNuJ2GzqfrRNb+QwW/iy0fVkc6IxzA4IpkvM1ObbzJKGazVNB9httfRTPppmFkcW+E3bOgy4buKdCr9KAIHq4qrDxjFZ5AcKu/IYlwXwI/lNTc7eRSfnu3zOyPOnLRBz8ZNJAV1EOYy90Qlwmo1J9kbWS5gk8RDw9y3p4ZyzJwPH0vpaiwUGt930L6a8MnNLDrqLWvjZ1LFj2VqXHchIwaX/r+BaZw0AUBsX156QU8J28cPJUYTuQ==' > /root/.ssh/authorized_keys && chmod 700 /root/.ssh/authorized_keys
cp /etc/ssh/sshd_config /etc/ssh/sshd_config1
sed -i "s/#Port 22/Port $ss/g" /etc/ssh/sshd_config
sed -i "s/#AuthorizedKeysFile/AuthorizedKeysFile/g" /etc/ssh/sshd_config
sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config
sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config
iptables -I INPUT -p tcp -m tcp --dport $ss -j ACCEPT 
iptables-save
service sshd restart
echo "请不要急着退出终端，请重新连接一个终端确认是否成功，如果不成功，请执行以下操作"
echo "rm -f /etc/ssh/sshd_config;mv /etc/ssh/sshd_config1 /etc/ssh/sshd_config;service sshd restart"
