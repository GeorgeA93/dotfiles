FROM ubuntu:16.04

# Update
RUN apt update

# Add custom repos
RUN apt install software-properties-common -y
RUN add-apt-repository \
    ppa:jonathonf/vim

# Update
RUN apt update

# Install packages
RUN apt install -y \
    git \
    vim \
    man \

