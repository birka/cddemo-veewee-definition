# Set up Vagrant.

echo 'heise ALL=NOPASSWD:ALL' > /etc/sudoers.d/heise

# Create the user heise with password heise
useradd -G sudo -p $(perl -e'print crypt("heise", "heise")') -m -s /bin/bash -U heise

# Install vagrant keys
mkdir -pm 700 /home/heise/.ssh
curl -Lo /home/heise/.ssh/authorized_keys \
  'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub'
chmod 0600 /home/heise/.ssh/authorized_keys
chown -R heise:heise /home/heise/.ssh

