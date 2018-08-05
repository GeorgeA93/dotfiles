FROM ubuntu:16.04

RUN apt update

RUN apt install software-properties-common -y
RUN add-apt-repository ppa:jonathonf/vim

RUN apt update

RUN apt install -y \
    git \
    vim \
    man \
    build-essential \
    cmake \
    tmux

RUN useradd -m grg && usermod -aG sudo grg
RUN echo 'grg:pass' | chpasswd
USER grg

WORKDIR home/grg

RUN git clone https://github.com/GeorgeA93/dotfiles.git
