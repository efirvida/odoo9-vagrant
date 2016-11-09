#!/usr/bin/env bash

# Note that this setup script is written with Ubuntu distro in mind.
# Specifically, "trusty64" box distributed directly from Vagrant project, which is Ubuntu 14.04.
# You have to carefully check all non-`/vagrant` paths here if you use a custom box.


echo -n "Installing odoo python dependencies... "
apt-get -y install ipython python-webdav python-pypdf python-pybabel python-imaging python-libxslt1 python-decorator python-serial python-pychart python-passlib python-setuptools python-simplejson python-six build-essential python-dev python-xlwt python-werkzeug python-vobject python-vatnumber python-unittest2 python-reportlab python-yaml python-openid python-ldap python-pyparsing python-pydot python-psutil python-psycopg2 python-mock python-mako python-lxml python-jinja2 python-gevent python-gdata python-feedparser python-docutils libfreetype6-dev libjpeg8-dev &> /dev/null
echo "(done)"


echo  -n "Installing Request... "
tar zxf requests-2.3.0.tar.gz &> /dev/null
cd requests-2.3.0 && python setup.py install &>/dev/null && cd .. && rm -R requests-2.3.0
echo "(done)"


echo  -n "Installing Pillow... "
unzip -qq Pillow-2.3.1.zip  &> /dev/null
cd Pillow-2.3.1   && python setup.py install &> /dev/null && cd .. && rm -R Pillow-2.3.1
echo "(done)"


echo  -n "Installing pyusb... "
tar zxf pyusb-1.0.0b1.tar.gz  &> /dev/null
cd pyusb-1.0.0b1  && python setup.py install &>/dev/null && cd .. && rm -R pyusb-1.0.0b1
echo "(done)"


echo  -n "Installing grcode... "
tar zxf qrcode-4.0.4.tar.gz   &> /dev/null
cd qrcode-4.0.4   && python setup.py install &>/dev/null && cd .. && rm -R qrcode-4.0.4
echo "(done)"


echo  -n "Installing pytz... "
bunzip2 pytz-2014.2.tar.bz2   &> /dev/null
tar xf pytz-2014.2.tar        &> /dev/null
cd pytz-2014.2    && python setup.py install &>/dev/null && cd .. && rm -R pytz-2014.2
echo "(done)"


echo  -n "Installing psycogreen... "
tar zxf psycogreen-1.0.tar.gz &> /dev/null
cd psycogreen-1.0 && python setup.py install &>/dev/null && cd .. && rm -R psycogreen-1.0
echo "(done)"


echo  -n "Installing gitlab... "
tar zxf gitlab3-0.5.4.tar.gz  &> /dev/null
cd gitlab3-0.5.4  && python setup.py install &>/dev/null && cd .. && rm -R gitlab3-0.5.4
echo "(done)"


echo  -n "Installing gitlab... "
tar zxf jcconv-0.1.6.tar.gz   &> /dev/null
cd jcconv-0.1.6   && python setup.py install &>/dev/null && cd ..  && rm -R jcconv-0.1.6
echo "(done)"


echo  -n "Installing wkhtmltox... "
dpkg -i wkhtmltox-0.12.1_linux-trusty-amd64 &>/dev/null
echo "(done)"

