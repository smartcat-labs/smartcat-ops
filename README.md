# smartcat-ops

Ops scripts and tools

## Provisioning

Provision your virtual machine with following command:

```
 ansible-playbook
   -i projects/{project_id}/inventory/{environment} projects/{project_id}/layers/{layer}.yml
   -e "project_id={project_id} env={environment}"
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
