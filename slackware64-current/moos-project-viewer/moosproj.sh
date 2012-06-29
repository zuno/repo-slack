#!/bin/bash
if [ $# -gt 0 ];then
  F=$(readlink -e "$@")
fi
cd /usr/share/moos-project-viewer
exec ./MOOS.sh "$F" &
