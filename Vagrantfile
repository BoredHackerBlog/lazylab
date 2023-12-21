# order: splunk, dc1, workstation1, kali
Vagrant.configure("2") do |config|
    config.vagrant.plugins = ["vagrant-reload"]
  
    config.vm.provider "virtualbox" do |v|
      v.linked_clone = true
      v.memory = 3072
      v.cpus = 1
      v.gui = true
    end
  
    config.vm.define "dc1" do |dc1|
      dc1.vm.guest = :windows
      dc1.vm.communicator = "winrm"
      dc1.vm.boot_timeout = 600
      dc1.vm.graceful_halt_timeout = 600
      dc1.winrm.retry_limit = 200
      dc1.winrm.retry_delay = 10
      dc1.winrm.max_tries = 20
      dc1.winrm.transport = :plaintext
      dc1.winrm.basic_auth_only = true
      dc1.vm.box = "StefanScherer/windows_2019"
      dc1.vm.network "private_network", ip: "192.168.200.11"
      dc1.vm.hostname = "dc1"
      dc1.vm.provision "shell", path: "scripts/change_timezone.bat", privileged: true
      dc1.vm.provision "shell", path: "scripts/install_dc.ps1", privileged: true
      dc1.vm.provision "reload"
      dc1.vm.provision "shell", path: "scripts/disable_update_firewall.bat", privileged: true
      dc1.vm.provision "shell", path: "scripts/disable_defender.ps1", privileged: true
      dc1.vm.provision "shell", path: "scripts/create_users.ps1", privileged: true
      dc1.vm.provision "shell", path: "scripts/add_task_dc.bat", privileged: true
      dc1.vm.provision "shell", path: "scripts/setup_logging.bat", privileged: true
      dc1.vm.provision "shell", path: "scripts/install_splunk.bat", privileged: true
      dc1.vm.provision "file", source: "resources/inputs.conf", destination: "C:\\Program Files\\SplunkUniversalForwarder\\etc\\apps\\SplunkUniversalForwarder\\local\\inputs.conf"
      dc1.vm.provision "reload"
    end
    
    config.vm.define "workstation1" do |workstation1|
      workstation1.vm.guest = :windows
      workstation1.vm.communicator = "winrm"
      workstation1.vm.boot_timeout = 600
      workstation1.vm.graceful_halt_timeout = 600
      workstation1.winrm.retry_limit = 200
      workstation1.winrm.retry_delay = 10
      workstation1.winrm.max_tries = 20
      workstation1.winrm.transport = :plaintext
      workstation1.winrm.basic_auth_only = true
      workstation1.vm.box = "StefanScherer/windows_2019"
      workstation1.vm.network "private_network", ip: "192.168.200.12"
      workstation1.vm.hostname = "workstation1"
      workstation1.vm.provision "shell", path: "scripts/change_timezone.bat", privileged: true
      workstation1.vm.provision "shell", path: "scripts/join_domain.ps1", privileged: true
      workstation1.vm.provision "shell", path: "scripts/disable_update_firewall.bat", privileged: true
      workstation1.vm.provision "shell", path: "scripts/disable_defender.ps1", privileged: true
      workstation1.vm.provision "shell", path: "scripts/add_task.bat", privileged: true
      workstation1.vm.provision "shell", path: "scripts/install_edge.bat", privileged: true
      workstation1.vm.provision "shell", path: "scripts/setup_logging.bat", privileged: true
      workstation1.vm.provision "shell", path: "scripts/install_splunk.bat", privileged: true
      workstation1.vm.provision "file", source: "resources/inputs.conf", destination: "C:\\Program Files\\SplunkUniversalForwarder\\etc\\apps\\SplunkUniversalForwarder\\local\\inputs.conf"
      workstation1.vm.provision "reload"
    end
  
    config.vm.define "splunk" do |splunk|
    splunk.vm.box = "ubuntu/focal64"
    splunk.vm.network "private_network", ip: "192.168.200.10"
    splunk.vm.provision "shell", privileged: true, inline: <<-SHELL
      timedatectl set-timezone America/New_York
      curl -fsSL https://get.docker.com -o get-docker.sh
      sh get-docker.sh
    SHELL
    splunk.vm.provision "shell", privileged: true, inline: <<-SHELL
      docker run --name so1 --hostname so1 -p 8000:8000 -p 9997:9997 -e "SPLUNK_START_ARGS=--accept-license" -e "SPLUNK_PASSWORD=password" -e "SPLUNK_LICENSE_URI=Free" -v "./var:/opt/splunk/var" -v "./etc:/opt/splunk/etc" --restart=always -d -it splunk/splunk:latest
    SHELL
    end

    config.vm.define "kali" do |kali|
    kali.vm.box = "kalilinux/rolling"
    kali.vm.network  "private_network", ip: "192.168.200.50"
    kali.vm.provision "shell", privileged: true, inline: <<-SHELL
      apt install sliver -y
    SHELL
    kali.vm.provision "reload"
    end

  end