EBS Volumes
=========

Create volume file storage && mount on the VM 

Variables
----------------

- ${destination} : /data if undifined
- ${method} : add or remove
- ${volume_name} : (UUID of the disk) first found if undifined

Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: ebs-volumes, destination: "/data", method: "add" }
