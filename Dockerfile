FROM cannyos/centos

RUN yum localinstall -y http://yum.theforeman.org/releases/1.8/el7/x86_64/foreman-release.rpm
RUN yum install -y foreman
CMD ["/bin/bash"]
