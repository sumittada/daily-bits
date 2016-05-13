### To make it easier to use the VM from terminal on Host machine
* Install vim

* Enable guest addons

* Add an extra network interface of the type Host-Only Adapter
* Add shared folder from host machine and give the user permissions to use it
 - sudo adduser <username> vboxsf

* Install ssh server
 - sudo apt-get install openssh-server 

* Disable sudo password for VM (Hey! Don't do it on a real machine!!)
 - Add following line to /etc/sudoers.d/<username>_nopasswd
 - <username> ALL=(ALL) NOPASSWD:ALL
 
* Update hostname
 - sudo vim /etc/hostname
