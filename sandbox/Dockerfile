FROM ubuntu:16.04

RUN apt update

# Add custom repos needed for dependencies
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:jonathonf/vim
RUN add-apt-repository ppa:cpick/hub

RUN apt update

# Install packages. This should be just enough for us to setup the rest using my
# dotfiles
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
    curl

RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

RUN useradd -m grg && usermod -aG sudo grg
USER grg

# We want everything from now on to happen in the users home directory
WORKDIR home/grg

RUN git clone https://github.com/GeorgeA93/dotfiles.git
RUN ./dotfiles/install.sh y
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

RUN rbenv install 2.5.1 && rbenv global 2.5.1
RUN gem install bundler

# Fixes theme colours due to nesting
RUN export TERM=xterm-color
