# ehealth-activiti
[Activiti](http://activiti.org/) is a light-weight workflow and Business Process Management (BPM) Platform. This puppet scripts downloads and installs Activiti in a tomcat container inside a virtual machine.

>> If you want to install OSCAR EMR or OpenMRS EMR, use [this script](https://github.com/E-Health/vagrant-ehealth)

## How to Use
- Install [VirtualBox for your OS](https://www.virtualbox.org/)
- Install [Vagrant for your OS](https://www.vagrantup.com/)
- Unzip / Clone this repository into a folder [Use the 'Download Zip' on the right panel]
- Windows Users can just doubleclick run.bat to start stop.bat to stop the VM.
- (For Mac Users) cd to that folder

```sh
vagrant up
```

> It takes approximately 10 minutes to create the machine initially.

## Access in your browser:
- Access Activiti at http://localhost:8001/activiti-explorer 

## Suspend / Power down / Destroy
To suspend the machine use and resume later
```sh
vagrant suspend
vagrant resume
```
To power down the machine and restart later
```sh
vagrant halt
vagrant up
```
To destroy the machine and recreate
```sh
vagrant destroy --force
vagrant up
```

### Version
1.0.0

### For more information visit [NuChange Blog](http://nuchange.ca)

### Contact Us on the IRC Channel ##ehealth 
[![Visit our IRC channel](https://kiwiirc.com/buttons/irc.freenode.net/ehealth.png)](https://kiwiirc.com/client/irc.freenode.net/?nick=nuchange|?##ehealth)



