FROM ubuntu:14.04
MAINTAINER Juuso Strömberg
RUN apt-get update
RUN apt-get install -y openssh-server screen irssi mosh
RUN mkdir /var/run/sshd
RUN useradd -m -G users irssi
ADD .userfile /
RUN cat .userfile | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin no/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

