FROM debian:sid

ENV TERM xterm-256color
ENV LANG en_US.UTF-8

RUN apt-get update
RUN apt-get install -y make gnupg apt-transport-https htop

RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
RUN apt-get update

RUN apt-get install -y sbt openjdk-8-jdk openjdk-8-source

RUN apt-get install -y emacs24-nox git

ADD dotfiles /root/dotfiles

RUN cd /root/dotfiles && make
RUN emacs -batch -l ~/.emacs

CMD cd ~ && emacs


