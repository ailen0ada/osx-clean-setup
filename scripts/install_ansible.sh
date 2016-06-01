#!/usr/bin/env bash

which pip >/dev/null 2>&1
if [ $? -ne 0 ];
then
  echo "pip was not found. installing..."
  sudo easy_install pip
fi

which ansible >/dev/null 2>&1
if [ $? -ne 0 ];
then
  echo "ansible was not found. installing..."
  sudo pip install ansible
fi