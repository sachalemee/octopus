# OCTOPUS

![OCTOPUS Storefront Image](doc/octopus_x_ansible_white.svg)

### Development

By *Marin Jeunot*(marin.jeunot@epitech.eu) & *Sacha Lemée*(sacha.lemee@epitech.eu).

## Objective

- "*You are going to work again with the poll application you worked with during the Popeye project. [...]. This time, you are going to deploy the application onto 5 different machines, without using containers, by using Ansible.*"

## Getting Started

### Prerequisites

This project requires:
- Ansible 2.9+
- SSH access to target machines (with SSH keys configured)
- Python 3 on target machines
- Linux/Unix environment (control node)
- An Ansible Vault holding the PostgreSQL password (not included in this repository, see step 4)

*No external libraries beyond Ansible are required.*

### Installation for Linux

1. **Clone the repository:**

```sh
git clone git@github.com:sachalemee/octopus.git
```

2. **Navigate to the project directory:**

```sh
cd octopus
```

3. **Configure your inventory:**

Edit or create an inventory file (typically in `/etc/ansible/hosts` or a local `inventory.ini`) with your target machines:

```ini
[redis]
redis-1 ansible_host=192.168.1.100 ansible_user=vboxuser

[postgresql]
postgresql-1 ansible_host=192.168.1.101 ansible_user=vboxuser

[poll]
poll-1 ansible_host=192.168.1.102 ansible_user=vboxuser

[worker]
worker-1 ansible_host=192.168.1.103 ansible_user=vboxuser

[result]
result-1 ansible_host=192.168.1.104 ansible_user=vboxuser

[all:vars]
ansible_password=changeme
```

4. **Create the Ansible Vault:**

The deployment reads the PostgreSQL password from the `vault_postgresql_password` variable. The original vault is not published, so you need to create your own before deploying.

Store your vault password in the file used by `one-click.sh`:

```sh
printf '%s\n' 'your-vault-password' > /tmp/.vault_pass
chmod 600 /tmp/.vault_pass
```

Then create the encrypted vault:

```sh
ansible-vault create group_vars/all/vault.yml --vault-password-file /tmp/.vault_pass
```

And add this content to it:

```yaml
vault_postgresql_password: your-postgresql-password
```

5. **Run the playbook:**

```sh
ansible-playbook playbook.yml -i inventory.ini --vault-password-file /tmp/.vault_pass
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
