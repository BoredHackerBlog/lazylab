# lazylab
Vagrant files to build a small attack lab/range. Has DC, workstation server, Splunk, and Kali

# Intro
This projects contains vagrant file to build a small AD lab that you can attack.
Lab contains DC (Server 2019), Workstation(Server 2019), Splunk(Docker on Ubuntu), and Kali Linux.

DC - 192.168.200.11

Workstation - 192.168.200.12

Splunk - http://192.168.200.10:8000

Kali - 192.168.200.50

# Setup
**!!!!!IMPORTANT!!!!!**: Edit the Vagrantfile file and remove kali linux downloading/wgetting a ransomware sample!! Don't accidentally run the sample in the VM while having other file systems mounted or connected!!

- Install Virtualbox and Vagrant
- Download the files and cd into the directory
- Run `vagrant up splunk dc1 workstation1 kali` or alternatively, bring up each machine one at a time. If you get an error with one of the Windows machines, detroy and try again.
- Wait ~30 mins to 1 hr.

# Usage
Once the VM's are running, I'd recommend snapshotting them. Ignore the vagrant username on Windows machines. I'd recommend starting by compromising workstation1.

Workstation login - UN: lazylab\dwight  PW: Beets12345

Kali login - UN: vagrant PW: vagrant

# Modification
Scripts folder contains installation scripts that you can modify. 

Resources contains a Splunk log collection config file that you can modify to get more logs.

# Other
This was inspired by a training I took from Antisyphon/Markus Schober. I highly recommend the training, especially for people starting to do DFIR or SOC work. 

https://www.antisyphontraining.com/event/ransomware-attack-simulation-and-investigation-for-blue-teamers/2023-12-07/

https://bluecapesecurity.com/


