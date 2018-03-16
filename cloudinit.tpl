#cloud-config

package_update: true

packages:
 - aptitude
 - software-properties-common
 - python-dev
 - libssl-dev
 - python-pip
 - unzip 
 - htop

package_upgrade: true

power_state:
 mode: poweroff
 condition: True

