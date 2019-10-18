FROM circleci/python:3.6.8

RUN sudo pip install awscli --no-cache-dir

RUN export PACKER_VERSION="1.4.4" \
    && sudo wget "https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip" -P "${HOME}" \
    && sudo unzip "${HOME}/packer_${PACKER_VERSION}_linux_amd64.zip" -d "${HOME}" \
    && sudo mv "${HOME}/packer" "/usr/local/bin" \
    && sudo rm "${HOME}/packer_${PACKER_VERSION}_linux_amd64.zip"
