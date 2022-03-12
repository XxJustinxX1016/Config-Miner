#!/bin/bash

set -e

print_brake() {
  for ((n = 0; n < $1; n++)); do
    echo -n "#"
  done
  echo ""
}

hyperlink() {
  echo -e "\e]8;;${1}\a${1}\e]8;;\a"
}

#### Colors ####

reset="\e[0m"
red='\033[0;31m'

error() {
  red='\033[0;31m'
  reset="\e[0m"

  echo ""
  echo -e "* ${red}ERROR${reset}: $1"
  echo ""
}


#### Check Sudo ####

if [[ $EUID -ne 0 ]]; then
  echo "* This script must be executed with root privileges (sudo)." 1>&2
  exit 1
fi


#### Check Curl ####

if ! [ -x "$(command -v curl)" ]; then
  echo "* curl is required in order for this script to work."
  echo "* install using apt (Debian and derivatives) or yum/dnf (CentOS)"
  exit 1
fi

cancel() {
echo
echo -e "* ${red}Installation Canceled!${reset}"
done=true
exit 1
}

done=false

echo
print_brake 70
echo "* Copyright (C) 2022 - $(date +%Y), XxJustinxX1016."
echo
echo "* Thank you for using this script"
print_brake 70
echo

wget https://github.com/xmrig/xmrig/releases/download/v6.16.4/xmrig-6.16.4-linux-static-x64.tar.gz
tar -zxf xmrig-6.16.4-linux-static-x64.tar.gz
cd xmrig-6.16.4
rm config.json
mv xmrig-6.16.4 xmrig

echo
print_brake 70
echo "pls cd xmrig and nano config.json"
echo
echo "screen -S mining ./xmrig for run the mining"
print_brake 70
echo
