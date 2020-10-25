FROM mono:latest

# environment 
ENV MEDIA_USER="plex"
ENV MEDIA_UID="999"
ENV MEDIA_GROUP="plex"
ENV MEDIA_GID="999"
ENV XDG_CONFIG_HOME="/config/xdg"

# plex user
RUN groupadd -g ${MEDIA_GID} ${MEDIA_GROUP} && useradd -m -u ${MEDIA_UID} -g ${MEDIA_GID} -s /bin/sh ${MEDIA_USER}

# directories
RUN mkdir -p /library /config
RUN chown -R ${MEDIA_USER}:${MEDIA_GROUP} /library /config

# volumes 
VOLUME ["/library", "/config"]

# pre-reqs for next steps
RUN apt-get update && apt-get install -y gnupg

# sonarr
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xA236C58F409091A18ACA53CBEBFF6B99D9B78493
RUN echo "deb http://apt.sonarr.tv/ master main" > /etc/apt/sources.list.d/sonarr.list
RUN apt-get update && apt-get install -y nzbdrone 

# cleanup
RUN apt-get clean

# launch sonarr
USER ${MEDIA_USER}:${MEDIA_GROUP}
CMD ["/usr/bin/mono", "--debug", "/opt/NzbDrone/NzbDrone.exe", "-nobrowser"]
EXPOSE 8989/tcp

