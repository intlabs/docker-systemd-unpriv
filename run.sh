#!/bin/bash
sudo date

CONTAINER=$(sudo docker run -d -p 80:80 -p 443:443 -p 3000:3000 --hostname="pxe.cannyos.local" maci/systemd /usr/lib/systemd/systemd)
echo ${CONTAINER}
echo "to enter docker container run: 
        docker exec -t -i ${CONTAINER} /bin/bash"
docker exec -t -i ${CONTAINER} /bin/bash
docker kill ${CONTAINER}
docker rm ${CONTAINER}

#RAILS_ENV=production bundle exec rake permissions:reset
#./script/rails s -e production
