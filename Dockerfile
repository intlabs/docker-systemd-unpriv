FROM cannyos/centos

RUN yum groupinstall -y "Development Tools"
RUN yum -y install gcc-c++ git ruby ruby-devel rubygems \
    libvirt-devel mysql-devel postgresql-devel openssl-devel \
    libxml2-devel sqlite-devel libxslt-devel zlib-devel \
    readline-devel tar
CMD ["/bin/bash"]
