#!/bin/bash

# Ensure apache2 is installed and running
puppet resource package apache2 ensure=present
puppet resource service apache2 ensure=running enable=true

# Remove the directory /tmp/6509183p/work if it exists and then recreate it
puppet resource file /tmp/6509183p/work ensure=absent
puppet resource file /tmp/6509183p/work ensure=directory owner=root group=root mode=0755

# Clone the repository into /tmp/6509183p/work
git clone https://github.com/jabircode/6509183p_POC_REPO.git /tmp/6509183p/work

# Replace the index.html file
cp /tmp/6509183p/work/index.html /var/www/html/index.html
