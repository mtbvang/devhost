Devhost
=======

Provisions Ubuntu 16.04 with development tools. It can be used to provision a localhost or a virtual machine using vagrant with either virutalbox or vmware providers. 

Requirements
------------

- Vagrant 2.0.1
- Virtualbox and/or VMWare Workstation

If you want to use a VMWare virtual machine the you will also need the vagrant VMWare provider https://www.vagrantup.com/vmware

To install the required vagrant boxes you need to build and add them using packer by running the gradle task:

```
./gradlew packer
```

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
