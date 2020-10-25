FROM mono:latest

# environment 
ENV MEDIA_USER="plex"
ENV MEDIA_UID="999"
ENV MEDIA_GROUP="plex"
ENV MEDIA_GID="999"
ENV XDG_CONFIG_HOME="/config/xdg"

# plex user
RUN groupadd -g ${MEDIA_GID} ${MEDIA_GROUP} && useradd -d /radarr-config -u ${MEDIA_UID} -g ${MEDIA_GID} -s /bin/sh ${MEDIA_USER}

# directories
RUN mkdir -p /library /config
RUN chown -R ${MEDIA_USER}:${MEDIA_GROUP} /library /config

# volumes 
VOLUME ["/library", "/config"]

# pre-reqs for next steps
RUN apt-get update && apt-get install -y gnupg

# radarr
RUN curl -L -O $( curl -s https://api.github.com/repos/Radarr/Radarr/releases | grep linux.tar.gz | grep browser_download_url | head -1 | cut -d '"' -f 4 )
RUN tar -xvzf Radarr.develop.*.linux.tar.gz
RUN mv Radarr /opt
RUN chmod -R 755 /opt/Radarr

# cleanup
RUN apt-get clean

# launch radarr
USER ${MEDIA_USER}:${MEDIA_GROUP}
CMD ["/usr/bin/mono", "--debug", "/opt/Radarr/Radarr.exe", "-nobrowser"]
EXPOSE 7878/tcp