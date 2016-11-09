#!/usr/bin/env bash

# Note that this setup script is written with Ubuntu distro in mind.
# Specifically, "trusty64" box distributed directly from Vagrant project, which is Ubuntu 14.04.
# You have to carefully check all non-`/vagrant` paths here if you use a custom box.

echo -n "Updating repositories... "
apt-get update  &>/dev/null
echo "(done)"

echo -n "Upgrading system... "
apt-get upgrade --yes --force-yes -f  &>/dev/null
echo "(done)"

echo -n "Installing aditional packages... "
apt-get --yes --force-yes install mc unzip htop  &>/dev/null
echo "(done)"

chmod +x /vagrant/.setup/vagrant/prepare-odoo-deb.sh
/vagrant/.setup/vagrant/prepare-odoo-deb.sh