# What else do we need to install to get my dotfiles up and running
# Probably some other shit
# How do we use the prompt here too, dotfiles install script asks us questions
# that we will need to respond to! e.g do you want to install X. Maybe we just
# run the thing manually on first setup. But make sure we install all
# depenendices in this docker file if that makes sense

FROM ubuntu:16.04

RUN apt update

# Add custom repos needed for dependencies
RUN apt install software-properties-common -y
RUN add-apt-repository \
    ppa:jonathonf/vim

RUN apt update

# Install packages. This should be just enough for us to setup the rest using my
# dotfiles
RUN apt install -y \
    git \
    vim \
    man

RUN useradd -m grg && usermod -aG sudo grg
USER grg

# We want everything from now on to happen in the users home directory
WORKDIR $HOME

RUN git clone https://github.com/georgea93/dotfiles
# we may need to just run this on first setup
RUN ./dotfiles/install.sh

