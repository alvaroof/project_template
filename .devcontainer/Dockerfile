FROM python:3.9.11-slim-bullseye

ARG DEBIAN_FRONTEND=noninteractive
ARG USER=user

ENV container docker

USER root

# Create non-root user
RUN groupadd $USER && useradd --gid $USER --shell /bin/bash --create-home $USER

RUN echo "Install dependencies..."\
 && apt-get update\
 && apt-get install\
  unixodbc-dev\
  build-essential\
  ca-certificates\
  curl\
  git-all\
  jq\
  htop\
  less\
  nano\
  vim\
  wget\
  zsh\
  -y --no-install-recommends\
 && apt-get clean\
 && rm -rf /var/lib/apt/lists/*
 
RUN echo "Install Conda..."\
 && cd /tmp\
 && curl https://repo.anaconda.com/archive/Anaconda3-2022.10-Linux-x86_64.sh --progress-bar -o installer.sh\
 && bash installer.sh -b -p $HOME/anaconda3\
 && rm installer.sh

# Upgrade pip then install poetry and wheel
RUN pip3 install --no-cache-dir --upgrade pip \
 && pip3 install --no-cache-dir wheel poetry

# Install oh-my-zsh
RUN yes Y | sh -c "$(curl -k -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

COPY .devcontainer/config_devcontainer.sh /tmp
