FROM ubuntu:14.04
MAINTAINER Juuso Strömberg
RUN apt-get update
RUN apt-get install -y openssh-server screen irssi mosh oidentd
RUN mkdir /var/run/sshd
ADD .userfile /
RUN newusers .userfile
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin no/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN locale-gen en_US
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

