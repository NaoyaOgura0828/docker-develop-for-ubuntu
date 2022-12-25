FROM ubuntu:22.04

# Execution user name after container startup
ARG USER_NAME

# Repository Update
RUN apt update -y
RUN apt upgrade -y

# Install sudo
RUN apt install sudo -y

# Install git
RUN apt install git -y

# Add User
RUN adduser ${USER_NAME} --force-badname

# Setup to use sudo without password
RUN echo "${USER_NAME} ALL=NOPASSWD: ALL" | tee /etc/sudoers

ENTRYPOINT tail -f /dev/null