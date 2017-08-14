#/bin/sh
echo '============================
      SSH Key Installer
	      V1.0 Alpha
		Author:Kirito
============================'
cd ~
mkdir .ssh
cd .ssh
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA4+itiSggwN8bnlFgPjkCTQ6ajgjbBDVk2/SWh7ZTDpmw3Zjc6F4zYE0tdGlTug2i2XdoDOsEgdgNE+UKilcMxYoq52VuRGPWfpNuJ2GzqfrRNb+QwW/iy0fVkc6IxzA4IpkvM1ObbzJKGazVNB9httfRTPppmFkcW+E3bOgy4buKdCr9KAIHq4qrDxjFZ5AcKu/IYlwXwI/lNTc7eRSfnu3zOyPOnLRBz8ZNJAV1EOYy90Qlwmo1J9kbWS5gk8RDw9y3p4ZyzJwPH0vpaiwUGt930L6a8MnNLDrqLWvjZ1LFj2VqXHchIwaX/r+BaZw0AUBsX156QU8J28cPJUYTuQ==' > authorized_keys
chmod 700 authorized_keys
cd ../
chmod 600 .ssh
cd /etc/ssh/
sed -i '/PasswordAuthentication/s/#PasswordAuthentication yes/PasswordAuthentication no/g' sshd_config

service sshd restart
service ssh restart
