FROM ubuntu:16.04

RUN apt update

RUN apt install software-properties-common -y
RUN add-apt-repository ppa:jonathonf/vim
RUN add-apt-repository ppa:cpick/hub

RUN apt update

RUN apt install -y \
    git \
    vim \
    man \
    build-essential \
    cmake \
    hub \
    python-dev \
    python3-dev \
    golang-go \
    zsh \
    curl \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev

RUN useradd -m grg && usermod -aG sudo grg
USER grg

WORKDIR home/grg

RUN export TERM=xterm-color

RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

RUN git clone https://github.com/GeorgeA93/dotfiles.git
RUN ./dotfiles/install.sh
RUN git clone https://www.github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
RUN echo "export TERM=xterm-color" >> ~/.private-env
