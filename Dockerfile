FROM cannyos/centos

RUN yum -y groupinstall "Development Tools"
RUN yum -y install gcc-c++ git ruby ruby-devel rubygems \
    libvirt-devel mysql-devel postgresql-devel openssl-devel \
    libxml2-devel sqlite-devel libxslt-devel zlib-devel \
    readline-devel tar
RUN yum install -y puppet puppet-server
WORKDIR /
RUN git clone https://github.com/theforeman/foreman.git -b develop /foreman
RUN cd /foreman && \
  cp config/settings.yaml.example config/settings.yaml && \
  cp config/database.yml.example config/database.yml && \
  gem install bundler
WORKDIR /foreman
RUN bundle install --without mysql2 pg test --path vendor # or postgresql
# set up database schema, precompile assets and locales
RUN RAILS_ENV=production bundle exec rake db:migrate
RUN RAILS_ENV=production bundle exec rake db:seed assets:precompile locale:pack
CMD ["/bin/bash"]
