#!/usr/bin/env bash

# Note that this setup script is written with Ubuntu distro in mind.
# Specifically, "trusty64" box distributed directly from Vagrant project, which is Ubuntu 14.04.
# You have to carefully check all non-`/vagrant` paths here if you use a custom box.

cp -R /vagrant/.setup/app /tmp
chown -R vagrant:vagrant /tmp 


echo -n "Installing PostgreSQL... "
sudo useradd -U -s /bin/bash postgres &> /dev/null
apt-get -y install postgresql postgresql-client &> /dev/null
sudo -u postgres createuser -d -s vagrant &> /dev/null
echo "(done)"
echo "PostgreSQL Server Status: " `service postgresql status| cut -d: -f2`


echo "Installing odoo dependencies..."
cd /tmp/app/dependencies
chmod +x ./odoo-dependencies.sh
sudo ./odoo-dependencies.sh
echo "Odoo dependencies (done)"


echo -n "installing odoo ... "
cd /tmp/app/
wget https://nightly.odoo.com/9.0/nightly/deb/odoo_9.0c.latest_all.deb
dpkg -i ./odoo_9.0c.latest_all.deb &>/dev/null
apt-get -y -f install &>/dev/null
dpkg -i ./odoo_9.0c.latest_all.deb &>/dev/null
echo "(done)"


echo -n "Installing odoo's addons... "
cd /tmp/app/dependencies && unzip -o runbot-addons-8.0.zip &>>1 && sudo cp -R runbot-addons-8.0/runbot_gitlab /usr/lib/python2.7/dist-packages/openerp/addons  &>>1
echo " (done)"


echo -n "Setting odoo start up... "
cp /vagrant/.setup/app/.openerp_serverrc /vagrant &>/dev/null
rm -f /etc/odoo/openerp-server.conf
ln -s /vagrant/.openerp_serverrc /home/vagrant &>/dev/null
ln -s /vagrant/.openerp_serverrc /etc/odoo/openerp-server.conf &>/dev/null
sed -i -e 's/USER=odoo/USER=vagrant/g' /etc/init.d/odoo
update-rc.d odoo defaults  &>/dev/null
echo "(done)"


echo -n "Starting odoo service... "
service odoo start &>/dev/null
echo "(done)"


echo -n "odoo service status:"
service odoo status| cut -d: -f2


