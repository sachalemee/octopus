# OCTOPUS

![OCTOPUS Storefront Image](doc/octopus_x_ansible_white.svg)

### Development

By *Marin Jeunot*(marin.jeunot@epitech.eu) & *Sacha Lemée*(sacha.lemee@epitech.eu).

## Objective

- "*You are going to work again with the poll application you worked with during the Popeye project. [...]. This time, you are going to deploy the application onto 5 different machines, without using containers, by using Ansible.*"
[OCTOPUS EPITECH Subject](doc/G-DOP-400_octopus.pdf)

## Getting Started

### Prerequisites

This project requires:
- Ansible 2.9+
- SSH access to target machines (with SSH keys configured)
- Python 3 on target machines
- Linux/Unix environment (control node)

*No external libraries beyond Ansible are required.*

### Installation for Linux

1. **Clone the repository:**

```sh
git clone git@github.com:EpitechPGE2-2025/G-DOP-400-PAR-4-1-octopus-15.git
```

2. **Navigate to the project directory:**

```sh
cd G-DOP-400-PAR-4-1-octopus-15
```

3. **Configure your inventory:**

Edit or create an inventory file (typically in `/etc/ansible/hosts` or a local `inventory.ini`) with your target machines:

```ini
[redis]
redis-server ansible_host=192.168.1.10 ansible_user=ubuntu

[postgresql]
postgres-server ansible_host=192.168.1.11 ansible_user=ubuntu

[poll]
poll-server ansible_host=192.168.1.12 ansible_user=ubuntu

[worker]
worker-server ansible_host=192.168.1.13 ansible_user=ubuntu

[result]
result-server ansible_host=192.168.1.14 ansible_user=ubuntu

[all:vars]
ansible_become_pass=your_sudo_password
```

4. **Run the playbook:**

```sh
ansible-playbook playbook.yml -i inventory.ini
```

Or use the one-click deployment script:

```sh
./one-click.sh
```

## Repository Architecture

See the complete repository architecture here: [OCTOPUS Project structure](doc/PROJECT_STRUCTURE.md)

## License

This project is licensed under the **MIT License**.

![OCTOPUS License : MIT](https://img.shields.io/badge/License-MIT-white.svg)
