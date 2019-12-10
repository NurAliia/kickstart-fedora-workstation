# Configure installation method	
url --metalink="https://mirrors.fedoraproject.org/metalink?repo=fedora-$releasever&arch=$basearch"

# zerombr
zerombr

# Configure Boot Loader
bootloader --location=mbr --driveorder=sda

# Create Physical Partition
part /boot --size=512 --asprimary --ondrive=sda --fstype=xfs
part swap --size=10240 --ondrive=sda 
part / --size=8192 --grow --asprimary --ondrive=sda --fstype=xfs

# Remove all existing partitions
clearpart --all --initlabel

# Configure Firewall
firewall --enabled --ssh

# Configure Network Interfaces
network --onboot=yes --bootproto=dhcp --hostname=nura-laptop

# Configure Keyboard Layouts
keyboard ru

# Configure Language During Installation
lang en_US

# Configure X Window System
xconfig --startxonboot

# Configure Time Zone
timezone Europe/Saratov

# Create User Account
user --name=nura --plaintext --password=Q1w2e3r4@ --groups=wheel

# Set Root Password
rootpw --lock

# Perform Installation in Text Mode
text

# Package Selection
%packages

chromium
java-openjdk
@Python Classroom
firefox
@LibreOffice
@gnome-desktop
ansible
git
vim
docker

%end

# Post-installation Script
%post
systemctl enable docker.service
%end

# Reboot After Installation
reboot --eject
