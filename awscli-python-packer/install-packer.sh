#!/bin/bash
# Reference: https://computingforgeeks.com/install-latest-packer-on-linux-freebsd-macos-windows/

export PACKER_VERSION="1.4.4"
sudo wget "https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip" -P "${HOME}"
sudo unzip "${HOME}/packer_${PACKER_VERSION}_linux_amd64.zip" -d "${HOME}"
sudo mv "${HOME}/packer" /usr/local/bin
sudo rm "${HOME}/packer_${PACKER_VERSION}_linux_amd64.zip"
