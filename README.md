docker run -d  --name transmission \
-p 51413:51413 -p 51413:51413/udp -p 9091:9091 \
-e "USERNAME=admin" \
-e "PASSWORD=watsons" \
-v /data/downloads:/transmission/downloads \
-v /data/downloads/incomplete:/transmission/incomplete \
imcat/docker-transmission
