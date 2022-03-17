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

    - hosts: all
      roles:
         - role: diffy0712.sysadmin-user-manager