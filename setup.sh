#! /bin/bash

pipx install ansible --include-deps
# include this in PATH even though it is injected into the ansible virtual env
pipx inject ansible ansible-dev-tools --include-deps --include-apps

ansible-galaxy collection install community.sops

sudo apt install age
# TODO: some way to install sops as well, perhaps in ansible directly?