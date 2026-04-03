#! /bin/bash

pipx install ansible --include-deps
# include this in PATH even though it is injected into the ansible virtual env
pipx inject ansible ansible-dev-tools --include-deps --include-apps
