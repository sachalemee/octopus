#!/bin/bash
export ANSIBLE_VAULT_PASSWORD_FILE=/tmp/.vault_pass
ansible-playbook playbook.yml -i inventory.ini --become --ask-become-pass
