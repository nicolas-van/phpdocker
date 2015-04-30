FROM phusion/baseimage:0.9.16

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

EXPOSE 80

ADD . /root/setup

# epel
RUN bash /root/setup/init_vm.bash
