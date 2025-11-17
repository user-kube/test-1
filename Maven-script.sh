#!/bin/bash
set -x
echo "==========================================="
echo "     This script will install the maven    "
echo "==========================================="

echo "We Need java-11 to run this maven"
amazon-linux-extras install java-openjdk11 -y 

cd /opt/
echo "For the Maven apache path you can download the path or get the link from https://maven.apache.org/download.cgi "

wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz

echo "untar the apache-maven file"
tar -xvf apache-maven-3.9.4-bin.tar.gz
mv apache-maven-3.9.4 maven

echo " checking maven version"

/opt/maven/bin/mvn -v 
sleep 10
echo "Setting up the bash profile"
cd ~
cat <<EOF > /root/.bash_profile
# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs


M2_HOME=/opt/maven/
M2=/opt/maven//bin/
JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.20.0.8-1.amzn2.0.1.x86_64/
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:$M2_HOME:$M2:$JAVA_HOME
export PATH

EOF
#sed -i 's#PATH=$PATH:$HOME/bin#PATH=$PATH:$HOME/bin:$M2_HOME:$M2:$JAVA_HOME#g'  /root/.bash_profile
source /root/.bash_profile

echo "thank you for using this scripts"