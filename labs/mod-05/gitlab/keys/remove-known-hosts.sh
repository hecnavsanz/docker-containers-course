#!/bin/bash

ssh-keygen -f "$HOME/.ssh/known_hosts" -R "[localhost]:33331"
ssh-keygen -f "$HOME/.ssh/known_hosts" -R "[localhost]:33332"
ssh-keygen -f "$HOME/.ssh/known_hosts" -R "[localhost]:33333"
ssh-keygen -f "$HOME/.ssh/known_hosts" -R "[localhost]:33334"
ssh-keygen -f "$HOME/.ssh/known_hosts" -R "[localhost]:33335"