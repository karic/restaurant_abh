FROM ubuntu:16.04
RUN apt-get update && \
      apt-get -y install sudo
RUN useradd -ms /bin/bash vagrant | chpasswd && adduser vagrant sudo
RUN echo "vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER vagrant
WORKDIR /usr/share/app
ADD --chown=vagrant . .
RUN sudo chmod +x /usr/share/app/Docker/app/provision.sh
RUN /usr/share/app/Docker/app/provision.sh
CMD ["/opt/play/activator", "run"]
