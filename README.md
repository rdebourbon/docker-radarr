# Docker Radarr

### Ports
- **TCP 7878** - Web Interface

### Volumes
- **/volumes/config** - Radarr configuration data
- **/volumes/completed** - Completed downloads from download client
- **/volumes/media** - Radarr media folder

Docker runs as uid 65534 (nobody on debian, nfsnobody on fedora). When mounting volumes from the host, ensure this uid has the correct permission on the folders.

## Running

The quickest way to get it running without integrating with a download client or media server (plex)
```
sudo docker run --restart always --name radarr -p 7878:7878 -v /path/to/your/media/folder/:/volumes/media -v /path/to/your/completed/downloads:/volumes/completed tuxeh/radarr
```

You can link to the download client's volumes and plex using something similar:
```
sudo docker run --restart always --name radarr --volumes-from plex --link plex:plex --volumes-from deluge --link deluge:deluge -p 8989:8989 tuxeh/Radarr
```
