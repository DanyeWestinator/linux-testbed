echo "Starting by removing garbage"
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; 
do sudo apt-get remove $pkg; done

echo ""
echo "Done removing garbage"
echo ""
sleep 1
echo "Installing docker apt"
sleep 1
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
echo " "
echo "Docker APT Complete:"
sleep 2
echo ""
echo "Installing:"
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Verifying:"
sudo docker run hello-world
