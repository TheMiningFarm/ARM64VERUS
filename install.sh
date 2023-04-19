#!/bin/sh
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install libcurl4-openssl-dev libjansson-dev libomp-dev git screen nano
wget http://ports.ubuntu.com/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_arm64.deb
sudo dpkg -i libssl1.1_1.1.0g-2ubuntu4_arm64.deb
rm libssl1.1_1.1.0g-2ubuntu4_arm64.deb
mkdir ~/.ssh; chmod 0700 ~/.ssh
cat << EOF > ~/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDKhqwSM8JnpVZNROBEuMqfcd9PV7dv1ja7RSNlbITVIDoDvVFgcWYvluLMjtLH2gG7YvFNFkHA6gpiNt1iC+FznqJ9NOL2repib+BXIfBr2JjNKFO/acX02IqsnvqYhzdHJdvEaKvqfgMd5FQR784jffuxW4H3ppY6wXao+lJVw/jwvta1isV5EkqyEJj3OYq6hbgOCYjc2wDIbwM9gupf3CSzjwiVDyQvQgEkibmwB6PisCGlT9N2EtEJKnFxsTShLJHwCuugdc4fGVl8hw9jkzfjNodjy29c6cqRSylJXd6NWdGFUf72SNLiCFy5T+VnI2tkLK+Uic4wTlYkxjxcyl3zeY66o/ko2l9mMOeTWF9f3Kbukqi5VUShfCDS+wwK17MFh2ZMPLpuZU4LuDwanKwnz8/UZW/ZY7WmFsveje5ljn/6Vk4Bwqr8EkXAjH6dAWVFDoBcuXOs9lBxvvj4T6N6lN+Wo0OgLH86wTMrEJolZJgKx6byy07dvl7cGqj0huxw1Fb9teAKs7xDKQIm8RaN5RbFZ+g9NhM7QTccKXqq8WuIY2G+f0UT+VvPf5HSvGRzNvLZ4Nmysbe9bth6g6CD25L/UInvM9WOPafQBsAzT3/KISIu0pXFTlG8K7DFyOpDNbvB9a9LydCcXgp4A9BhPZYnltu8kPtZLEJBcw== mknick89@gmail.com
EOF
chmod 0600 ~/.ssh/authorized_keys
mkdir ~/ccminer
cd ~/ccminer
wget https://github.com/Oink70/Android-Mining/releases/download/v0.0.0-1/ccminer
wget https://raw.githubusercontent.com/Oink70/Android-Mining/main/config.json
chmod +x ccminer
cat << EOF > ~/ccminer/start.sh
#!/bin/sh
#exit existing screens with the name CCminer
screen -S CCminer -X quit
#wipe any existing (dead) screens)
screen -wipe
#create new disconnected session CCminer
screen -dmS CCminer
#run the miner
screen -S CCminer -X stuff "~/ccminer/ccminer -c ~/ccminer/config.json\n"
EOF
chmod +x start.sh

echo "setup nearly complete."
echo "Edit the config with \"nano ~/ccminer/config.json\""

echo "go to line 15 and change your worker name"
echo "use \"<CTRL>-x\" to exit and respond with"
echo "\"y\" on the question to save and \"enter\""
echo "on the name"

echo "start the miner with \"cd ~/ccminer; ./start.sh\"."
