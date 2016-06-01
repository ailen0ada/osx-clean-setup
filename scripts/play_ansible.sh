#!/bin/bash
. scripts/context.sh
show_context

TASK_NAME=$(basename $0)
function pa_echo () {
  echo [${TASK_NAME}] $1
}

cd ${PROVISIONING_HOME}/provisioning > /dev/null 2>&1

pa_echo "Playing common playbook"
HOMEBREW_CASK_OPTS="--appdir=/Applications" ansible-playbook playbook.yml -i hosts


if [ $ANSIBLE_VERSION_MAJOR -eq 1 ]
then
  DEFAULTS_PLAYBOOK=playbook_defaults_v1.yml
else
  DEFAULTS_PLAYBOOK=playbook_defaults.yml
fi

pa_echo "Playing playbook is ${DEFAULTS_PLAYBOOK}, depending on ansible version"
ansible-playbook ${DEFAULTS_PLAYBOOK} -i hosts

osascript -e 'display notification "Playing finished. Please restart or logout to take effect." with title "osx-provisioning"'