Ansible Server Manager User Role
=========

A really simple ansible role to create the first user on the remote system for accessing via ansible.

Requirements
------------

A fress system. No other requirements.

Role Variables
--------------

Available variables are listed below, along with default values (see defaults/main.yml):
```
sysuser_name: sysadmin
```
The user's name

```
sysuser_password: astrongpasswordfromavaultfile
```
The user's password

```
sysuser_keys:
  - somekey
```
An array of public keys the user should have authorized.

Dependencies
------------

No dependencies.

Example Playbook
----------------

Using [roles](https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html#using-roles)
```
---
- hosts: all
  roles:
      - role: diffy0712.sysadmin-user-manager
```

Using [include_role](https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html#including-roles-dynamic-reuse)
```
---
- hosts: all
  tasks:
    - name: Print a message
      ansible.builtin.debug:
        msg: "this task runs before the example role"

    - name: Include the example role
      include_role:
        name: example

```