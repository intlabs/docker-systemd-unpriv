#!/bin/bash
sudo date

CONTAINER=$(sudo docker run -it -p 80:80 -p 443:443 -p 3000:3000 --hostname="pxe.cannyos.local" maci/systemd )
docker kill ${CONTAINER}
docker rm ${CONTAINER}

#RAILS_ENV=production bundle exec rake permissions:reset
#./script/rails s -e production
