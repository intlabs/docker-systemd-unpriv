FROM centos:6

RUN rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
RUN yum -y install epel-release http://yum.theforeman.org/releases/1.8/el6/x86_64/foreman-release.rpm
RUN yum -y install foreman-installer

CMD ["/bin/bash"]
