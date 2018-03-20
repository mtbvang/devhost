Devhost
=======

Provisions Ubuntu 16.04 with development tools. It can be used to provision a localhost or a virtual machine using vagrant with either virutalbox or vmware providers. 

Requirements
------------

- Vagrant 2.0.1
- Virtualbox and/or VMWare Workstation
- Ubuntu 16.04

If you want to use a VMWare virtual machine the you will also need the vagrant VMWare provider https://www.vagrantup.com/vmware

To install the required vagrant boxes you need to build and add them using packer by running the gradle task:

```
./gradlew packer
```

Usage
-----

To start a virtual machine. Clone this repository and then run from the project root directory:

```
./gradlew up
```


This repository can be used to spin up a virtual machine with the Ubuntu 16.04 development host or to provision a local development host.

To provision a local host:

```
curl https://raw.githubusercontent.com/mtbvang/devhost/master/provision/install.sh --output install.sh
chmod +x install.sh
sudo -i
./install.sh

```

The development host machine can be incrementally updated by applying specific ansible tags e.g.:

```
git clone https://github.com/mtbvang/devhost
cd devhost
./gradlew ansibleRoles
./gradlew ansibleprovision -PansibleTags=oc --no-daemon
```

The -PansibleTags=oc only runs tasks tagged with the label oc.


Role Variables
--------------

Look in vars/main.yml and default/main.yml

Dependencies
------------

Look at requirements.yml

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: devhost, x: 42 }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
