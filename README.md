## Ansible deployment

### 1. Setup

Install ansible requirements:
```bash
ansible-galaxy install -r requirements.yaml
```

### 2. Playbooks
#### 2.1. Transmission

```bash
ansible-playbook -i hosts/inventory.yaml --extra-vars "@vars/transmission.yaml" transmission.yaml
```
