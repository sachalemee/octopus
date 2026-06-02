#!/bin/bash
ansible-playbook playbook.yml -i inventory.ini --become --ask-become-pass
