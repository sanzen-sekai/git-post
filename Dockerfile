FROM ubuntu:disco

ENV DEBIAN_FRONTEND noninteractive

RUN set -x && \
  apt-get update && \
  apt-get install -y \
    ca-certificates \
    curl \
    git \
    python-pip \
  && \
  : "to fix vulnerabilities, update packages : 2020-01-27" && \
  apt-get install -y --no-install-recommends \
    e2fsprogs \
    libcom-err2 \
    libext2fs2 \
    libss2 \
  && \
  : "install awscli" && \
  pip install awscli && \
  : "cleanup apt caches" && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  : "add working user" && \
  useradd -m getto && \
  : "environment prepared"

USER getto

CMD ["/bin/bash"]
