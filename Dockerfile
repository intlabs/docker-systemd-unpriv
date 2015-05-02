FROM cannyos/centos

RUN yum groupinstall "Development Tools"
RUN yum -y install gcc-c++ git ruby ruby-devel rubygems \
    libvirt-devel mysql-devel postgresql-devel openssl-devel \
    libxml2-devel sqlite-devel libxslt-devel zlib-devel \
    readline-devel tar
WORKDIR /
RUN git clone https://github.com/theforeman/foreman.git -b develop /foreman
RUN cd /foreman && \
  cp config/settings.yaml.example config/settings.yaml && \
  cp config/database.yml.example config/database.yml && \
  gem install bundler
CMD ["/bin/bash"]
