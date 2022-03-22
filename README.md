# Ansible Server Manager User Role
![ansible badge](https://img.shields.io/badge/Ansible-000000?style=for-the-badge&logo=ansible&logoColor=white)

- [Ansible Server Manager User Role](#ansible-server-manager-user-role)
  - [Introduction](#introduction)
  - [Intent](#intent)
  - [Requirements](#requirements)
  - [Role Variables](#role-variables)
  - [Dependencies](#dependencies)
  - [Example Playbook](#example-playbook)

## Introduction
A really simple ansible role to create sysadmin user on the remote system for accessing via ansible.

## Intent
When working with ansible-playbooks, I usually access the server's via a custom `ansible` user. This user is only used by ansible.   
Other users of the system get their own users. This ensures better logging and user management.

## Requirements

A fress system. No other requirements.

## Role Variables

Available variables are listed below, along with default values (see defaults/main.yml):

| Variable (default value)      | Description | Default Value |
| ----------- | ----------- | ----------- |
| __sysadmin_user__      | The user's name       | sysadmin |
| __sysadmin_password__      | The user's password       |  astrongpasswordfromavaultfile |
| __sysadmin_keys__      | An array of public keys the user should have authorized.       | ```[somekey, otherkey]``` |
| __sysadmin_issudoer__      | Add user as sudoer      | yes |

## Dependencies

No dependencies.

## Example Playbook

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

    - name: Include sysadmin-user-manager role
      include_role:
        name: diffy0712.sysadmin-user-manager

```