Users Management
=========

Create Users and add generated keys-pairs on the host

Role Variables
--------------

- ${public_key} : generated if undifined
- ${user_name} : adm by default
- ${output} : ../../ssh/private_key.pem if undifined
- ${sudo} : true if undifined
- ${sudo_no_passwd} : true if undifined

Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: users-management, method: "add", public_key: false, user_name: "admin", output: "~/.ssh/private_key.pem" }
