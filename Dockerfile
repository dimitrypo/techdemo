FROM ubuntu:16.04
#RUN echo "deb http://archive.ubuntu.com/ubuntu raring main universe" > /etc/apt/sources.list

RUN "sh" "-c" "echo nameserver 8.8.8.8 > /etc/resolv.conf"

RUN apt-get update --fix-missing

RUN apt-get install -y curl mysql-client mysql-server git wget p7zip-full libmysqlclient-dev libmysqlclient-dev nodejs mc screen locales

RUN export LANG=en_US.UTF-8
RUN export LANGUAGE=en_US.UTF-8
RUN export LC_ALL=en_US.UTF-8
RUN dpkg-reconfigure locales


RUN echo "mysql-server mysql-server/root_password password railsrails" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password railsrails" | debconf-set-selections



RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

RUN \curl -L https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "source /etc/profile.d/rvm.sh"
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.3.1"

RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"


WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN /bin/bash -l -c "gem install bundler"
RUN /bin/bash -l -c "bundle install"

ADD . /techdemo
WORKDIR /techdemo
EXPOSE 3000
