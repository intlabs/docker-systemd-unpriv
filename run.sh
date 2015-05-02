#!/bin/bash
sudo date

docker run -it --rm -p 80:80 -p 443:443 -p 3000:3000 --hostname="pxe.cannyos.local" maci/systemd

#RAILS_ENV=production bundle exec rake permissions:reset
#./script/rails s -e production
