# Readme.md

## NUC Management
- Run Ansible code: `ansible-playbook -i inventory.yml site-nuc.yml --vault-password-file vaultPassword`


## Vault stuff
- Create vault: `ansible-vault create group_vars/all/secrets.yml`
- Edit vault: `ansible-vault edit group_vars/all/secrets.yml`


## Container stuff
- Enter shell: `docker container exec --tty --interactive splunk /bin/bash`
- Run container: `docker run --rm -it netmon /bin/bash`
- Build image: `docker image build . --file Dockerfile --tag netmon`