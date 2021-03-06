# Setup
sudo adduser --system ggc_user
sudo groupadd --system ggc_group

# Install pre-reqs
sudo apt-get update
sudo apt-get install -y sqlite3 python2.7 binutils curl


wget -O /vagrant/downloads/root.ca.pem http://www.symantec.com/content/en/us/enterprise/verisign/roots/VeriSign-Class%203-Public-Primary-Certification-Authority-G5.pem

# Copy greengrass binaries
sudo tar -xzf /vagrant/downloads/greengrass-ubuntu-x86-64-1.5.0.tar.gz -C /

# Install ML inference dependencies (MXNet)
sudo apt-get install -y python-pip python-dev gcc
sudo pip install mxnet
sudo apt-get install -y python-opencv

# Install aws cli
sudo pip install awscli
sudo pip install greengo

# Create a source for images to map into the Lambda space later
sudo mkdir /images
sudo chown ggc_user:ggc_group /images

# Back up group.json - you'll thank me later
sudo cp /greengrass/ggc/deployment/group/group.json /greengrass/ggc/deployment/group/group.json.orig


git clone https://github.com/dzimine/aws-greengrass-ml-inference.git

#manually run in virtual machine
# AWS CLI
#aws configure

#cd  /home/vagrant/aws-greengrass-ml-infere
#greengo create
#sudo cp /home/vagrant/aws-greengrass-ml-infere/certs/* /greengrass/certs
#sudo cp /home/vagrant/aws-greengrass-ml-infere/config/* /greengrass/config
#sudo cp /vagrant/downloads/root.ca.pem /greengrass/certs
#cd /greengrass/ggc/core
#sudo ./greengrassd start
