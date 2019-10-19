FROM python:3.6.8-slim

RUN \
    # install virtualenv, awscli
    && pip install virtualenv --no-cache-dir \
    && pip install awscli --no-cache-dir \
    # install curl, jq, perl, bash, make, git
    && apt-get update \
    && apt-get install -y --no-install-recommends wget \
    && apt-get install -y --no-install-recommends curl \
    && apt-get install -y --no-install-recommends unzip \
    && apt-get install -y --no-install-recommends jq \
    && apt-get install -y --no-install-recommends make \
    && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/* \
    # install packer
    && export PACKER_VERSION="1.4.4" \
    && wget "https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip" -P "${HOME}" \
    && unzip "${HOME}/packer_${PACKER_VERSION}_linux_amd64.zip" -d "${HOME}" \
    && mv "${HOME}/packer" "/usr/local/bin" \
    && rm "${HOME}/packer_${PACKER_VERSION}_linux_amd64.zip" \
