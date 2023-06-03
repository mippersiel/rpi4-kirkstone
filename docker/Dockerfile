FROM ubuntu:22.04
ARG USER_NAME
ARG USER_ID
ARG GROUP_ID

# Setup env. variable to tell dpkg that this is a non interactive shell
ENV DEBIAN_FRONTEND noninteractive

# Install apt-utils for following apt-get installs
RUN apt-get update && apt-get install --yes --no-install-recommends apt-utils

# Setup locale
RUN apt-get install --yes --no-install-recommends locales
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "LANG=en_US.UTF-8" > /etc/locale.conf
RUN dpkg-reconfigure locales

# Install needed packages
RUN apt-get install --yes --no-install-recommends \
          gawk \
          wget \
          git \
          diffstat \
          unzip \
          texinfo \
          gcc \
          file \
          build-essential \
          chrpath \
          socat \
          cpio \
          python3 \
          python3-pip \
          python3-pexpect \
          xz-utils \
          debianutils \
          iputils-ping \
          python3-git \
          python3-jinja2 \
          libegl1-mesa \
          libsdl1.2-dev \
          xterm \
          python3-subunit \
          mesa-common-dev \
          zstd \
          liblz4-tool \
          sudo \
          vim

# Create user and group
RUN groupadd --gid "${GROUP_ID}" "${USER_NAME}"
RUN useradd --uid "${USER_ID}" --gid "${GROUP_ID}" --comment "${USER_NAME}" -m -s /bin/bash --groups sudo "${USER_NAME}"
RUN echo "${USER_NAME}:${USER_NAME}" | chpasswd

# Set image's user and switch to home directory
USER "${USER_NAME}"
WORKDIR "/home/${USER_NAME}"

