# Ansible Server Manager User Role
[![CI](https://github.com/diffy0712/ansible-role-sysadmin-user-manager/workflows/CI/badge.svg?event=push)](https://github.com/diffy0712/ansible-role-sysadmin-user-manager/actions?query=workflow%3ACI)

- [Ansible Server Manager User Role](#ansible-server-manager-user-role)
  - [Introduction](#introduction)
  - [Intent](#intent)
  - [Requirements](#requirements)
  - [Getting Started](#getting-started)
    - [Install in playbook](#install-in-playbook)
    - [Define required variables](#define-required-variables)
  - [Role Variables](#role-variables)
  - [Dependencies](#dependencies)
  - [Examples](#examples)
    - [Example Playbook](#example-playbook)
    - [Advanced Example](#advanced-example)

## Introduction
A really simple ansible role to create sysadmin user on the remote system for accessing via ansible.

## Intent
When working with ansible-playbooks, I usually access the server's via a custom `ansible` user. This user is only used by ansible.   
Other users of the system get their own users. This ensures better logging and user management.

## Requirements

None.

## Getting Started

### Install in playbook
Install the role using ansible-galaxy:  
`ansible-galaxy install diffy0712.sysadmin_user_manager`

Add to `requirements.yml`:  
```
---
roles:
  - 'diffy0712.sysadmin_user_manager'
```
Then run `ansible-galaxy install -r requirements.yml -p roles`  


Or clone this repository:  
`git@github.com:diffy0712/ansible-role-sysadmin-user-manager.git`

### Define required variables

Define the folliwing variables:
```
sysadmin_password: example
sysadmin_keys: 
  - yourpublickey
```

Thats it. 

## Role Variables

Available variables are listed below, along with default values (see defaults/main.yml):

| Variable (default value)      | Description | Default Value |
| ----------- | ----------- | ----------- |
| __sysadmin_user__      | The user's name       | sysadmin |
| __sysadmin_password__      | The user's password       |  astrongpasswordfromavaultfile |
| __sysadmin_keys__      | An array of public keys the user should have authorized.       | ```[somekey, otherkey]``` |
| __sysadmin_issudoer__      | Add user as sudoer      | yes |
| __sysadmin_files__      | List of files or directory to copy to remote for the user. eg: dotfiles      | ```{file: ./files/.bashrc, dest: /home/ansible/.bashrc}[]``` |

## Dependencies

No dependencies.

## Examples
### Example Playbook

Using [roles](https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html#using-roles)
```
---
- hosts: all
  vars:
    - sysadmin_password: example
    - sysadmin_keys: 
        - yourpublickey
  roles:
      - role: diffy0712.sysadmin-user-manager
```

Using [include_role](https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html#including-roles-dynamic-reuse)
```
---
- hosts: all
  vars:
    - sysadmin_password: example
    - sysadmin_keys: 
        - yourpublickey
  tasks:
    - name: Print a message
      ansible.builtin.debug:
        msg: "this task runs before the example role"

    - name: Include sysadmin-user-manager role
      include_role:
        name: diffy0712.sysadmin-user-manager

```

### Advanced Example

```
---
- hosts: all
  vars:
    - sysadmin_user: ansible
    - sysadmin_password: example
    - sysadmin_shell: '/bin/bash'
    - sysadmin_issudoer: yes
    - sysadmin_keys: 
        - yourpublickey
    - sysadmin_files:
        - file: ./files/.bashrc
          dest: /home/ansible/.bashrc
        - file: ./files/test.txt
          dest: /home/ansible/test.txt
  roles:
      - role: diffy0712.sysadmin-user-manager
```