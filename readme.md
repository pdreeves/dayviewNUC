# Readme.md

## NUC Management
- Command to run playbooks against entire environment for the first time: `ansible-playbook -i inventory.yml site.yml --ask-pass --vault-password-file secretPassword`
- Additional runs: `ansible-playbook -i inventory.yml site.yml --extra-vars '{"updateKernel":"true", "ansible_ssh_private_key_file":"~/.ssh/nuc.dayview.greentangent.net"}' --vault-password-file secretPassword`

## Vault stuff
- Edit vault: `ansible-vault edit group_vars/all/secrets.yml`


## Container stuff
- Enter shell: `docker container exec --tty --interactive splunk /bin/bash`
- Run container: `docker run --rm -it netmon /bin/bash`
- Build image: `docker image build . --file Dockerfile --tag netmon`
