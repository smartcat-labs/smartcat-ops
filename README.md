# smartcat-ops

Ops scripts and tools. Prerequest for OPS scripts is Vagrant and Ansible.

##Mac installation

###Vagrant

Vagrant uses VirtualBox. To install it use homebrew and following command:
```
brew cask install virtualbox
```

After that you can install vagrant as well with homebrew:
```
brew cask install vagrant
```

###Ansible

After that you need to install Ansible and you are good to go:
```
brew install ansible
```

## Provisioning

Provision your virtual machine with following command:

```
 ansible-playbook
   -i projects/{project_id}/inventory/{environment} projects/{project_id}/layers/{layer}.yml
   -e "project_id={project_id} env={environment}"
```

Projects may require additional Ansible roles from [Ansible-Galaxy](https://galaxy.ansible.com/) hub. In order
to install those dependencies the following command could be issued:

```
ansible-galaxy install -r projects/{project_id}/requirements.yml
```

##Folder organization

*Roles* folder consists of reusable roles, each is self contained and from layer you define which set of roles
you want to install for that layer.

*Projects* consists of all projects.

*Project* folder has
 - environments which can be production, staging, local etc.
 - files which is placeholder for various files
 - inventory folder has inventory for environments
 - layers has vertical layers application is using (database, application, web)
 - project.yml is main file for project configuration
 - Vagrantfile contain vagrant configuration for virtual machine
